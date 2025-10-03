FROM node:22.20.0

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --omit=dev

FROM node:22.20.0

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

COPY . .

EXPOSE 1557

CMD ["npm", "start"]