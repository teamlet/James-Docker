# Run James

FROM openjdk:8u171-jdk

MAINTAINER stonelu "stonelu214@gmail.com"

# Add build environment
ENV SRC_DIR /usr/local/james
ENV WORK_DIR $SRC_DIR/bin
ENV VOLUME_DIR $SRC_DIR/conf

# Set work directory
WORKDIR $WORK_DIR

RUN mkdir /opt/tmp \
  && cd /opt/tmp \
  && wget https://downloads.apache.org/james/server/3.4.0/james-server-app-3.4.0-app.zip \
  && unzip james-server-app-3.4.0-app.zip \
  && mv james-server-app-3.4.0-app/* $SRC_DIR/ \
  && rm -rf /opt/tmp  

# Add volume of James configuration directory
VOLUME  $VOLUME_DIR

# Expose ports
EXPOSE 25 465 110 995 143 993

CMD ["sh", "run.sh"]
