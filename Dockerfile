FROM node:lts-alpine

WORKDIR /usr/src/app

COPY . .
RUN npm install

EXPOSE 3000

RUN chown -R node /usr/src/app
USER node

CMD ["npm", "start"]
