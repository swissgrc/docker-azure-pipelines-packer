# Base image containing dependencies used in builder and final image
FROM ghcr.io/swissgrc/azure-pipelines-azurecli:2.62.0-net8 AS base


# Builder image
FROM base AS build

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Download Packer

# renovate: datasource=repology depName=debian_12/curl versioning=deb
ENV CURL_VERSION=7.88.1-10+deb12u6
# renovate: datasource=github-releases depName=hashicorp/packer extractVersion=^v(?<version>.*)$
ENV PACKER_VERSION=1.11.2
# renovate: datasource=repology depName=debian_12/unzip versioning=deb
ENV UNZIP_VERSION=6.0

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends curl=${CURL_VERSION} unzip=${UNZIP_VERSION}-28 && \
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
