FROM jenkins

USER root
RUN apt-get update \
      && apt-get install -y sudo git maven
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

CMD ["--prefix=/jenkins"]

COPY *.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install Docker
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.11.0
ENV DOCKER_SHA256 87331b3b75d32d3de5d507db9a19a24dd30ff9b2eb6a5a9bdfaba954da15e16b

RUN set -x \
    && cd \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& sudo mv docker/* /usr/local/bin/ \
    && ls -al /usr/local/bin \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v


