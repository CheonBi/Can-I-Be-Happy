FROM node:22.20.0

WORKDIR /happy-card

COPY package.json package-lock.json ./

RUN npm install --omit=dev

FROM node:22.20.0

WORKDIR /happy-card

COPY --from=builder /happy-card/node_modules ./node_modules

COPY . .

EXPOSE 1557

CMD ["npm", "start"]