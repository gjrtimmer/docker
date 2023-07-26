ARG ARG DOCKER_PROXY
FROM ${DOCKER_PROXY}/docker:24.0.2-git

RUN apk add --no-cache --update \
    build-base \
    bash \
    findutils \
    pcre-tools \
    git-lfs \
    curl \
    wget \
    coreutils \
    tar

ARG BUILD_DATE
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG VCS_REF
ARG DOCKER_IMAGE

LABEL \
    maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=${CI_PROJECT_NAME} \
    org.label-schema.url="${CI_PROJECT_URL}" \
    org.label-schema.vcs-url="${CI_PROJECT_URL}.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.docker.image="${DOCKER_IMAGE}" \
    org.label-schema.license=MIT

# EOF