FROM node:22.20.0-alpine AS builder
 
WORKDIR /app

COPY happy-card/package.json happy-card/package-lock.json ./

RUN npm install 

COPY happy-card/ .

RUN npm run build