FROM node:22.20.0 AS builder
 
WORKDIR /app

COPY happy-card/package.json happy-card/package-lock.json ./

RUN npm install --omit=dev

FROM node:22.20.0

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

COPY happy-card/ .

EXPOSE 1557

CMD ["npm", "start"]