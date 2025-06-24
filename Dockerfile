# hadolint global ignore=DL3022
FROM harbor.local/docker.io/docker:28.2.2-cli

# hadolint ignore=DL3018
RUN apk add --no-cache --update \
    build-base \
    bash \
    findutils \
    pcre-tools \
    git \
    git-lfs \
    curl \
    wget \
    coreutils \
    tar \
    ca-certificates \
    zip \
    unzip \
    sed

COPY --from=gitlab LOCAL_ROOT_CA /usr/local/share/ca-certificates/Local_Root_CA.crt
COPY --from=gitlab LOCAL_TURING_PI_CA /usr/local/share/ca-certificates/Local_Turing_PI_CA.crt
COPY --from=gitlab LOCAL_OID_CA /usr/local/share/ca-certificates/Local_OID_CA.crt
COPY --from=gitlab LOCAL_TURING_PI_CA /etc/docker/certs.d/harbor.local/ca.crt

ARG TARGETARCH
ADD https://dl.min.io/client/mc/release/linux-${TARGETARCH}/mc /usr/bin/mc

RUN update-ca-certificates && \
    chmod +x /usr/bin/mc

ARG BUILD_DATE
ARG CI_PROJECT_NAME
ARG CI_PROJECT_URL
ARG VCS_REF

LABEL maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>"
LABEL org.opencontainers.image.version="${BUILD_DATE}"
LABEL org.opencontainers.image.authors="G.J.R. Timmer <gjr.timmer@gmail.com>"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.title="${CI_PROJECT_NAME}"
LABEL org.opencontainers.image.url="${CI_PROJECT_URL}"
LABEL org.opencontainers.image.documentation="${CI_PROJECT_URL}"
LABEL org.opencontainers.image.source="${CI_PROJECT_URL}.git"
LABEL org.opencontainers.image.ref.name=${VCS_REF}
LABEL org.opencontainers.image.revision=${VCS_REF}
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.vendor=timmertech.nl
