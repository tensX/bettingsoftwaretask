# Dockerfile

FROM ubuntu:24.04

# Обновление и установка нужных пакетов
RUN apt-get update && \
    apt-get install -y openssh-server supervisor procps && \
    apt-get clean

# Создаем папки для SSH и supervisord
RUN mkdir -p /var/run/sshd /var/log/supervisor

# Копируем конфигурацию supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Запускаем supervisord
CMD ["/usr/bin/supervisord", "-n"]
