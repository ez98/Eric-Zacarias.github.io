FROM jenkins/agent:alpine-jdk11
USER root
RUN apk add --no-cache curl
RUN curl -L -o /usr/bin/jq https://github.com/jqlang/jq/releases/download/jq-1.7/jq-linux64
RUN chmod +x /usr/bin/jq
USER jenkins