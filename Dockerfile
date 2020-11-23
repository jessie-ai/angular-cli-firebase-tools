FROM node:lts-alpine

MAINTAINER Stephan Leicht Vogt <stephan@jessie.ai>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.license="MIT" \
      org.label-schema.name="angular-cli-firebase-tools" \
      org.label-schema.description="Docker image based on NodeJS official image with Angular CLI and Firebase Tools installed." \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/jessie-ai/angular-cli-firebase-tools" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

# Commands
RUN npm i -g npm@latest \
            typescript@latest \
            @angular/cli@latest \
            firebase-tools@latest \
            mocha@latest \
            nx@latest \
        --no-audit
