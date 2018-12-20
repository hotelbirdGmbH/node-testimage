FROM node:8.9.4

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable unzip && \
    rm -rf /var/lib/apt/lists/* 

# Clean up image
RUN apt-get -qq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup Sonar Cube
RUN curl -o sonar-scanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
RUN unzip sonar-scanner.zip
RUN chmod +x ./sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner

