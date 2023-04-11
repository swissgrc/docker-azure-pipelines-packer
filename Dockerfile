# Base image containing dependencies used in builder and final image
FROM ghcr.io/swissgrc/azure-pipelines-azurecli:2.46.0 AS base


# Builder image
FROM base AS build

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Download Packer

# renovate: datasource=repology depName=debian_11/curl versioning=loose
ENV CURL_VERSION=7.74.0-1.3+deb11u7
# renovate: datasource=github-releases depName=hashicorp/packer extractVersion=^v(?<version>.*)$
ENV PACKER_VERSION=1.8.6
# renovate: datasource=repology depName=debian_11/unzip versioning=loose
ENV UNZIP_VERSION=6.0-26+deb11u1

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends curl=${CURL_VERSION} unzip=${UNZIP_VERSION} && \
  # Download Packer
  curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
  unzip /tmp/packer.zip -d /tmp && \
  rm /tmp/packer.zip


# Final image
FROM base AS final

LABEL org.opencontainers.image.vendor="Swiss GRC AG"
LABEL org.opencontainers.image.authors="Swiss GRC AG <opensource@swissgrc.com>"
LABEL org.opencontainers.image.title="azure-pipelines-packer"
LABEL org.opencontainers.image.documentation="https://github.com/swissgrc/docker-azure-pipelines-packer"

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /
COPY --from=build /tmp/ /tmp

# Install Packer

RUN cp /tmp/packer /usr/bin/packer && \
  rm -rf /tmp/* && \
  # Smoke test
  packer version && \
  # Ensure prerequisits are available
  git version
