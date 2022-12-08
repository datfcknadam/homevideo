FROM nginx:stable

COPY ./rootfs /

ARG nginx_uid=1000
ARG nginx_gid=1000

RUN usermod -u 1000 nginx
RUN groupmod -g 1000 nginx