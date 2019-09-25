FROM docker:18-git
ARG VCS_REF
ARG BUILD_DATE

LABEL \
	maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.build-date=${BUILD_DATE} \
	org.label-schema.name=docker \
	org.label-schema.vendor=timmertech.nl \
	org.label-schema.url="https://gitlab.timmertech.nl/docker/docker" \
	org.label-schema.vcs-url="https://gitlab.timmertech.nl/docker/docker.git" \
	org.label-schema.vcs-ref=${VCS_REF} \
	nl.timmertech.license=MIT

RUN apk upgrade --update && \
	apk add --no-cache --update --virtual libs \
	libffi-dev \
	openssl-dev \
	build-base \
	python3-dev && \
	apk add --no-cache --update \
	curl \
	pcre-tools \
	python3 \
	py3-pip && \
	if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
	if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
	pip install --upgrade pip && \
	pip install docker-compose && \
	apk del libs
