FROM mhart/alpine-node:7

EXPOSE 1337

WORKDIR /var/www/
COPY package.json /var/www/
RUN npm install --save-dev mocha
RUN npm install express
RUN npm run test
COPY . /var/www/
CMD [ "node", "index.js" ]