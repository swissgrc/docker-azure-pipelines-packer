# Docker image for running Packer commands in Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-packer/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-packer/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-packer/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-packer&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-packer) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-packer.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-packer) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-packer.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-packer)
<!-- markdownlint-restore -->

Docker image to run Packer commands in [Azure Pipelines container jobs].

## Usage

This image can be used to run Packer commands in [Azure Pipelines container jobs].

### Azure Pipelines Container Job

To use the image in an Azure Pipelines Container Job, add one of the following example tasks and use it with the `container` property.

The following example shows the container used for a deployment step with a Packer command

```yaml
  - stage: deploy
    jobs:
      - deployment: buildPacker
        container: swissgrc/azure-pipelines-packer:latest
        environment: smarthotel-dev
        strategy:
          runOnce:
            deploy:
              steps:
                - bash: |
                    packer build .
```

## Included Software
- [swissgrc/azure-pipelines-azurecli:net9](https://github.com/swissgrc/docker-azure-pipelines-azurecli-net9) as base image
- Packer

## Tags

| Tag      | Description                                           | Size                                                                                                                            |
|----------|-------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| latest   | Latest stable release (from `main` branch)            | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/latest?style=flat-square)   |
| unstable | Latest unstable release (from `develop` branch)       | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/unstable?style=flat-square) |
| x.y.z    | Image for a specific version of Packer                |                                                                                                                                 |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
