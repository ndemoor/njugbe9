FROM njugbe/node:0.10.26

MAINTAINER Nils De Moor

ADD . /var/www
RUN cd /var/www && npm install

EXPOSE 3000

CMD [ "node", "/var/www/server.js" ]
