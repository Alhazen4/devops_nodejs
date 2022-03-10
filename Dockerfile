FROM mhart/alpine-node:7

EXPOSE 1337

WORKDIR /var/www
COPY package.json /var/www/
COPY index.js /var/www/
COPY node.test.js /var/www/
RUN npm install --save-dev mocha
RUN npm run test