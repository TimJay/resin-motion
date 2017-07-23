FROM resin/raspberrypi3-debian:jessie

ENV INITSYSTEM on

RUN apt-get update && apt-get install -y \
    motion \
    nginx \
    cron \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
EXPOSE 8081

COPY motion.conf /opt/motion.conf
COPY on_event_start.sh /opt/on_event_start.sh
RUN chmod u+x /opt/on_event_start.sh
COPY on_event_end.sh /opt/on_event_end.sh
RUN chmod u+x /opt/on_event_end.sh
COPY nginx.conf /etc/nginx/sites-enabled/default

# reboot container hourly to trigger the automatic camera light adaption
RUN echo "23 * * * * /sbin/shutdown -r now" | crontab

CMD ["motion", "-c", "/opt/motion.conf"]
