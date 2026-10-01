FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY nginx-loadbalancer.conf .

RUN rm /etc/nginx/conf.d/default.conf

RUN mv nginx-loadbalancer.conf default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]