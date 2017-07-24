FROM resin/raspberrypi3-debian:jessie

ENV INITSYSTEM on

RUN apt-get update && apt-get install -y \
        motion \
        nginx \
        cron \
        gettext-base &&\
    rm -rf /var/lib/apt/lists/*

COPY motion.conf.template /opt/motion.conf.template
COPY on_event_start.sh /opt/on_event_start.sh
COPY on_event_end.sh /opt/on_event_end.sh
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY run.sh /opt/run.sh
RUN chmod u+x /opt/on_event_start.sh &&\
    chmod u+x /opt/on_event_end.sh &&\
    chmod u+x /opt/run.sh

# reboot container hourly to trigger the automatic camera light adaption
RUN echo "23 * * * * /sbin/shutdown -r now" | crontab

CMD ["/opt/run.sh"]
