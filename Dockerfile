FROM nginx:alpine
COPY ./dist/unified-dashboard-front-pfe-ooredoo /usr/share/nginx/html
EXPOSE 4201
CMD ["nginx","-g","daemon off;"]
