FROM nginx

ARG AUTOR

ENV ENV_AUTOR=$AUTOR

WORKDIR /usr/share/nginx/html

COPY Hello_docker.html .

RUN sed -e s/"Hello Docker"/"$ENV_AUTOR"/ Hello_docker.html > index.html ;

CMD ["nginx", "-g", "daemon off;"]