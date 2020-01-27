FROM nginx:1.12-alpine
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./build /usr/share/nginx/myapp
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
