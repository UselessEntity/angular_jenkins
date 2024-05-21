### State 1
FROM node as build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build -- --output-path=./dist

FROM nginx:1.26-alpine

ENV NODE_ENV=develop

COPY --from=build /app/dist /usr/share/nginx/html

RUN sed -i 's/listen 80/listen 10.100.1.125:8004/g' /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
