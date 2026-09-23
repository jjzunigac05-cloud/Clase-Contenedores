### STAGE 1: Build ###
FROM cachac/dockerlabs_base:node14 as build

WORKDIR /usr/src/app

#   COMPILATION **************

### STAGE 2: Release ###
FROM nginx:stable-alpine as release

COPY --from=build /usr/src/app/dist /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]