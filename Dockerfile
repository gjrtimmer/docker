FROM docker:24.0.2-git

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
    build_version="${BUILD_DATE}" \
    org.opencontainers.image.authors="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="${CI_PROJECT_NAME}" \
    org.opencontainers.image.url="${CI_PROJECT_URL}" \
    org.opencontainers.image.documentation="${CI_PROJECT_URL}" \
    org.opencontainers.image.source="${CI_PROJECT_URL}.git" \
    org.opencontainers.image.ref.name=${VCS_REF} \
    org.opencontainers.image.revision=${VCS_REF} \
    org.opencontainers.image.base.name="docker.io/library/docker:24.0.2-git" \
    org.opencontainers.image.licenses=MIT \
    org.opencontainers.image.vendor=timmertech.nl

# EOF