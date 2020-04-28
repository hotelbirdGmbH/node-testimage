#!/bin/bash

if [ $CI_COMMIT_REF_SLUG == 'master' ]
then
    echo "Run sonaqube for master branch"
    /sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner -Dsonar.host.url=$SONAR_SCANNER_HOST -Dsonar.login=$SONAR_TOKEN
elif [ $CI_COMMIT_REF_SLUG == 'development' ]
then
    echo "Run sonaqube for development branch"
    /sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner -Dsonar.host.url=$SONAR_SCANNER_HOST -Dsonar.login=$SONAR_TOKEN -Dsonar.branch.name=$CI_COMMIT_REF_SLUG
else
    echo "Run sonaqube for feature branch"
    /sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner -Dsonar.host.url=$SONAR_SCANNER_HOST -Dsonar.login=$SONAR_TOKEN -Dsonar.branch.name=$CI_COMMIT_REF_SLUG
fi
