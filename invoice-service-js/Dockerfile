FROM node:20.19.1-alpine3.21

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm install

RUN apk add --no-cache bash

COPY . .
RUN chmod +x wait-for-it.sh