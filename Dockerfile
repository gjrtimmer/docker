FROM docker:git
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

RUN apk add --no-cache --update \
	curl \
	build-base \
	bash \
	wget \
	git-lfs \
	pcre-tools \
	docker-compose

# EOF