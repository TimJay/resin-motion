FROM resin/raspberrypi3-debian:jessie

ENV INITSYSTEM on

RUN apt-get update && apt-get install -y \
    motion \
    nginx \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
EXPOSE 8081

COPY motion.conf /opt/motion.conf
COPY on_event_start.sh /opt/on_event_start.sh
RUN chmod u+x /opt/on_event_start.sh
COPY on_event_end.sh /opt/on_event_end.sh
RUN chmod u+x /opt/on_event_end.sh
COPY nginx.conf /etc/nginx/sites-enabled/default

CMD ["motion", "-c", "/opt/motion.conf"]
