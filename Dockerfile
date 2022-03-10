FROM mhart/alpine-node:7

EXPOSE 1337

WORKDIR /var/www/
COPY package.json ./
RUN npm install --save-dev mocha
RUN npm install express
COPY . ./
RUN npm run test
CMD [ "node", "index.js" ]