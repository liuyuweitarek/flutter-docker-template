FROM nginx:1.19.6-alpine

RUN cp -ip /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.org
RUN mkdir -p /var/www/html

COPY ./conf.d/* /etc/nginx/conf.d/