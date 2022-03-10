FROM node:10-alpine

EXPOSE 8080

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install --save-dev mocha
RUN npm run test
COPY --chown=node:node . .
CMD [ "node", "index.js" ]