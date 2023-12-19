FROM node:16.14.2

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app/node_modules
WORKDIR /usr/src/app

COPY ./bin /usr/src/app/bin
COPY ./db_migrations /usr/src/app/migrations
COPY ./public /usr/src/app/public
COPY ./rest /usr/src/app/rest
COPY ./routes /usr/src/app/routes
COPY ./views /usr/src/app/views
COPY ./config /usr/src/app/config
COPY ./libs /usr/src/app/libs
COPY ./node_modules /usr/src/app/node_modules
COPY ./app.js /usr/src/app
COPY ./package.json /usr/src/app/

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

EXPOSE 3000

ENTRYPOINT npm start