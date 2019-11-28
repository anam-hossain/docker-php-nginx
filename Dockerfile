FROM nginx:1.17-alpine

LABEL org.label-schema.name="Anam Hossain"

ENV NGINX_ROOT /var/www
ENV NGINX_FPM_HOST localhost
ENV NGINX_FPM_PORT 9000

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./nginx.conf /etc/nginx/nginx-fpm.tmpl

RUN rm -f /etc/nginx/conf.d/default.conf

WORKDIR /var/www

EXPOSE 80

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]