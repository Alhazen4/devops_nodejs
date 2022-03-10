FROM mhart/alpine-node:7

EXPOSE 1337

WORKDIR /var/www/
COPY . ./
RUN npm install --save-dev mocha
RUN npm install express
RUN npm run test
CMD [ "node", "index.js" ]