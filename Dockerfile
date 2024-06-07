FROM node:22-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 8080

RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
