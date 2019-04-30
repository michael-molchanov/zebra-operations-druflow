FROM michaeltigr/zebra-php-base:latest

LABEL maintainer "Michael Molchanov <mmolchanov@adyax.com>"

USER root

# Set the Drush version.
ENV DRUSH_VERSION 8.2.3

# Install Drush 8 with the phar file.
RUN curl -fsSL -o /usr/local/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
  chmod +x /usr/local/bin/drush

# Test your install.
RUN drush core-status

# Install Java, druflow & assemble gradle & groovy.
ENV JAVA_HOME=/usr
RUN apk add --update --no-cache openjdk7-jre-base \
  && rm -rf /var/lib/apt/lists/* \
  && git clone --branch=v0.1.4 --depth=1 --single-branch https://github.com/aroq/druflow.git \
  && cd druflow \
  && ./gradlew assemble
