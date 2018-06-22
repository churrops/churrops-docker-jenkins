FROM jenkins/jenkins:2.128-alpine

LABEL   maintainer="Rodrigo Floriano de Souza" \
        email="florianocomercial@gmail.com" \

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
#RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root

ADD https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz /tmp
RUN tar -xvzf /tmp/docker-latest.tgz && \
    mv docker/* /usr/bin/ && \
    chmod +x /usr/bin/docker && \
    rm -f /tmp/docker-latest.tgz

RUN apk --no-cache add shadow && \
    addgroup $USER docker && \
    usermod -aG docker jenkins
