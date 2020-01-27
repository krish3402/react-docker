FROM node:10-alpine as build-deps
WORKDIR /app
COPY package.json ./
RUN yarn
COPY . /app/
RUN yarn build

# Stage 2 - the production environment
FROM nginx:1.12-alpine
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY --from=build-deps /app/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-deps /app/build /usr/share/nginx/myapp
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
