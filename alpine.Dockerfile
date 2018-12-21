FROM node:alpine

RUN npm install -g yarn &&\
    apk --no-cache --update add openjdk8-jre curl sed unzip

# setup Sonar Cube
RUN curl -s --insecure -o ./sonarscanner.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip && \
    unzip -q sonarscanner.zip -x sonar-scanner-3.2.0.1227-linux/jre/lib/amd64/server/libjsig.so && \
    rm sonarscanner.zip && \
    mv sonar-scanner-3.2.0.1227-linux /root/sonar-scanner && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /root/sonar-scanner/bin/sonar-scanner || echo 'sonar-scanner is installed '