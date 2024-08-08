#!/usr/bin/env sh

filename_is_valid() {
    (
        filename="$1"
        if [ -z "$filename" ]; then
            exit 1 # empty string
        fi
        case "$filename" in
            *[!a-zA-Z0-9._-]*)
                exit 1 # invalid characters
                ;;
            *)
                exit 0
                ;;
        esac
    )
    return $?
}

# import functions
. "$(dirname "$0")/../utils.sh"

# cd to the top level of the repo
REPO_ROOT=$(get_repo_root); IS_REPO=$?
if [ "$IS_REPO" -ne 0 ]; then
    echo "ERROR: The current directory does not seem to be within a git repo. Check your working directory and try again."
    exit 1
fi
cd "$REPO_ROOT" || { echo "ERROR: Failed to navigate to \`$REPO_ROOT\`'."; exit 1; }

# load the project's active .env file
if ! load_env; then
    echo "ERROR: No environment detected. Please set an environment first."
    exit 1
fi

ensure_docker_is_running
# start db if necessary
docker_service_is_running db; db_was_running=$?

if [ "$db_was_running" -eq 1 ]; then
    echo "==> starting the \`db\` service container..."
    docker compose -f "$PROJECT_COMPOSE_FILE" up -d db > /dev/null 2>&1
fi

# init migration table
#   table should contain the following fields --
#       - version: int id, PK
#       - name: the migration filename
#       - hash: md5sum of the script
#       - supports_rollback: whether a rollback script is implemented
#       - dirty: script has changed on disk and needs to be re-run (or reverted)
docker compose -f "$PROJECT_COMPOSE_FILE" exec db psql -U "$INFLOW_DB_USER" -d "$INFLOW_DB_NAME" -c "
CREATE TABLE IF NOT EXISTS migration (
    version             INTEGER     PRIMARY KEY,
    name                TEXT        NOT NULL,
    hash                CHAR(32)    NOT NULL,
    supports_rollback   BOOLEAN     NOT NULL,
    dirty               BOOLEAN     NOT NULL DEFAULT FALSE,
    date_applied        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);" > /dev/null 2>&1

# create new migration
#   get the next version number up,
#   get a filename from the user,
#   touch files for that version and name in {migrate,rollback,validate}
if [ "$1" = "create" ]; then
datestamp=$(date +%Y%m%d)

echo "Enter a filename for this migration."
echo "Your name will be prefixed with today's date."

while true; do
        # use of `printf` here avoids the newline at the end of the prompt that
        # `echo` would create
    printf "[%s-<migration_name>] > " "$datestamp"
    read -r migration_name
    if filename_is_valid "$migration_name"; then
        break
    else
        echo "Invalid filename. Please use alphanumeric characters, underscores, hyphens, and periods."
    fi
done

    echo "==> Creating {migrate,rollback,validate}/${datestamp}-${migration_name}.sql ..."

    mkdir -p database/migrations/migrate
    mkdir -p database/migrations/rollback
    mkdir -p database/migrations/validate

    touch -a "database/migrations/migrate/${datestamp}-${migration_name}.sql"
    touch -a "database/migrations/rollback/${datestamp}-${migration_name}.sql"
    touch -a "database/migrations/validate/${datestamp}-${migration_name}.sql"

    exit 0
fi

# apply migration(s)
#   - get the target version from .env, or run all migrations
#   - for each migration:
#       - run migration script
#       - run validation script. rollback upon failure
#       - populate table with migration metadata on success

# sync metadata table with migrations on disk
#   loop over migrations:
#       - compare migration hashes, dirty files in the metadata table as needed
#       - check if migration is supported, update in metadata table as needed
#       - report on changes

# roll back migration(s)
#   - get a target version from user
#   - query database to see if the run of necessary rollbacks exist
#   - if so, run them in reverse order

# shutdown db if it was not running before the script ran
if [ "$db_was_running" -eq 1 ]; then
    echo "==> stopping \`db\` service container, as it was not running before export."
    docker compose -f "$PROJECT_COMPOSE_FILE" stop db > /dev/null 2>&1
fi
