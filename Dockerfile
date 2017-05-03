FROM michaeltigr/zebra-php-base:latest

LABEL maintainer "Michael Molchanov <mmolchanov@adyax.com>"

USER root

# Install Java, druflow & assemble gradle & groovy.
ENV JAVA_HOME=/usr
RUN apk add --update --no-cache openjdk7-jre-base \
  && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/aroq/druflow.git \
  && cd druflow \
  && ./gradlew assemble
