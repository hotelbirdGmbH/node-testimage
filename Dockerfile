FROM node:13-buster
ARG SONAR_SCANNER_VERSION="4.3.0.2102"
ENV DEBIAN_FRONTEND=noninteractive

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y google-chrome-stable unzip

# setup Sonar Cube
RUN curl -o sonar-scanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip -q sonar-scanner.zip &&\
    rm sonar-scanner.zip && \
    chmod +x ./sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner

# Clean up image
RUN apt-get remove -y unzip && \
    apt-get -qq autoremove && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

