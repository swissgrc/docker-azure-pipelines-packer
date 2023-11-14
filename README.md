# Docker image for running Packer commands in Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-packer/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-packer/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-packer/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-packer&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-packer) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-packer.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-packer) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-packer.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-packer)
<!-- markdownlint-restore -->

Docker image to run Packer commands in [Azure Pipelines container jobs].

## Usage

This image can be used to run Packer commands in [Azure Pipelines container jobs].

The following software is additionally available in the image:

| Software   | Included since |
|------------|----------------|
| Azure Cli  | 1.8.6          |
| Git        | 1.8.6          |
| .NET       | 1.8.6          |
| Docker CLI | 1.8.6          |

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

### Tags

| Tag      | Description                                                                     | Base Image                                    | Packer | Size                                                                                                                            |
|----------|---------------------------------------------------------------------------------|-----------------------------------------------|--------|---------------------------------------------------------------------------------------------------------------------------------|
| latest   | Latest stable release (from `main` branch)                                      | swissgrc/azure-pipelines-azurecli:2.51.0-net6 | 1.9.4  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/latest?style=flat-square)   |
| unstable | Latest unstable release (from `develop` branch)                                 | swissgrc/azure-pipelines-azurecli:2.53.1-net6 | 1.9.4  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/unstable?style=flat-square) |
| 1.8.6    | [Packer 1.8.6](https://github.com/hashicorp/packer/releases/tag/v1.8.6)         | swissgrc/azure-pipelines-azurecli:2.46.0      | 1.8.6  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.8.6?style=flat-square)    |
| 1.8.7    | [Packer 1.8.7](https://github.com/hashicorp/packer/releases/tag/v1.8.7)         | swissgrc/azure-pipelines-azurecli:2.48.1      | 1.8.7  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.8.7?style=flat-square)    |
| 1.9.0    | [Packer 1.9.0](https://github.com/hashicorp/packer/releases/tag/v1.9.0)         | swissgrc/azure-pipelines-azurecli:2.49.0      | 1.9.0  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.9.0?style=flat-square)    |
| 1.9.1    | [Packer 1.9.1](https://github.com/hashicorp/packer/releases/tag/v1.9.1)         | swissgrc/azure-pipelines-azurecli:2.50.0-net6 | 1.9.1  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.9.1?style=flat-square)    |
| 1.9.2    | [Packer 1.9.2](https://github.com/hashicorp/packer/releases/tag/v1.9.2)         | swissgrc/azure-pipelines-azurecli:2.50.0-net6 | 1.9.2  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.9.2?style=flat-square)    |
| 1.9.3    | [Packer 1.9.3](https://github.com/hashicorp/packer/releases/tag/v1.9.3)         | swissgrc/azure-pipelines-azurecli:2.50.0-net6 | 1.9.3  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.9.3?style=flat-square)    |
| 1.9.4    | [Packer 1.9.4](https://github.com/hashicorp/packer/releases/tag/v1.9.4)         | swissgrc/azure-pipelines-azurecli:2.51.0-net6 | 1.9.4  | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-packer/1.9.4?style=flat-square)    |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
