FROM node:10-alpine

EXPOSE 8080

WORKDIR /var/www
COPY . /var/www/
USER node
RUN npm install --save-dev mocha
RUN npm run test
CMD [ "node", "index.js" ]