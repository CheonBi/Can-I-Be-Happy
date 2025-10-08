FROM node:22.20.0-alpine AS builder
 
WORKDIR /app

COPY happy-card/package.json happy-card/package-lock.json ./

RUN npm install 

COPY happy-card/ .

RUN npm run build

# Serve stage
FROM nginx:stable-alpine

COPY happy-card/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]