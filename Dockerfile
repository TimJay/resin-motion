FROM resin/raspberrypi3-debian:jessie

ENV INITSYSTEM on

RUN apt-get update && apt-get install -y \
        motion \
        nginx \
        cron \
        gettext-base \
        shellcheck &&\
    rm -rf /var/lib/apt/lists/*

COPY motion.conf.template /opt/motion.conf.template
COPY nginx.conf /etc/nginx/sites-enabled/default
COPY on_event_start.sh on_event_end.sh run.sh /opt/
RUN shellcheck /opt/run.sh /opt/on_event_start.sh /opt/on_event_end.sh

# restart container hourly to trigger the automatic camera light adaption
# reboot device daily for stability
RUN echo "23 * * * * /sbin/shutdown -r now" | crontab &&\
	echo "13 3 * * * curl -X POST --header \"Content-Type:application/json\" \"$RESIN_SUPERVISOR_ADDRESS/v1/reboot?apikey=$RESIN_SUPERVISOR_API_KEY\"" | crontab

CMD ["/opt/run.sh"]
