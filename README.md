# angular-cli-firebase-tools

Docker image based on official [NodeJS image](https://hub.docker.com/_/node) with [Angular CLI](https://cli.angular.io/) and [Firebase CLI](https://www.npmjs.com/package/firebase-tools) installed.

[![version](https://img.shields.io/docker/v/jessieai/angular-cli-firebase-tools?sort=semver)](https://hub.docker.com/r/jessieai/angular-cli-firebase-tools/)
[![image_pulls](https://img.shields.io/docker/pulls/jessieai/angular-cli-firebase-tools?label=pulls)](https://hub.docker.com/r/jessieai/angular-cli-firebase-tools/)
[![Build Status](https://github.com/jessie-ai/angular-cli-firebase-tools/actions/workflows/default.yml/badge.svg)](https://github.com/jessie-ai/angular-cli-firebase-tools/actions/workflows/default.yml)

## Overview

This Docker image provides a ready-to-use environment for Angular development with Firebase integration. It includes:

- **Angular CLI** (latest version)
- **Firebase CLI** (tools for Firebase project management)
- **Mocha** (testing framework)
- **Nx** (build system with first-class monorepo support)

## Available Tags

The image is available in multiple Node.js versions:

- `jessieai/angular-cli-firebase-tools:latest` - Based on Node.js LTS Alpine
- `jessieai/angular-cli-firebase-tools:latest-node-lts` - Based on Node.js LTS Alpine
- `jessieai/angular-cli-firebase-tools:latest-node-20` - Based on Node.js 20 Alpine
- `jessieai/angular-cli-firebase-tools:latest-node-22` - Based on Node.js 22 Alpine

Version-specific tags are also available following the pattern: `{version}-{node-version}[-alpine]`

## Usage

### Pull the image
```bash
docker pull jessieai/angular-cli-firebase-tools:latest
```

### Basic usage
```bash
# Run interactively
docker run -it --rm jessieai/angular-cli-firebase-tools:latest

# Mount your project directory
docker run -it --rm -v $(pwd):/app -w /app jessieai/angular-cli-firebase-tools:latest
```

### Common use cases

#### Create a new Angular project
```bash
docker run -it --rm -v $(pwd):/app -w /app jessieai/angular-cli-firebase-tools:latest ng new my-app
```

#### Build an Angular project
```bash
docker run -it --rm -v $(pwd):/app -w /app jessieai/angular-cli-firebase-tools:latest ng build
```

#### Deploy to Firebase
```bash
docker run -it --rm -v $(pwd):/app -w /app jessieai/angular-cli-firebase-tools:latest firebase deploy
```

#### Run tests with Mocha
```bash
docker run -it --rm -v $(pwd):/app -w /app jessieai/angular-cli-firebase-tools:latest mocha test/
```

## Docker Compose Example
```yaml
version: '3.8'
services:
  angular-dev:
    image: jessieai/angular-cli-firebase-tools:latest
    volumes:
      - .:/app
      - node_modules:/app/node_modules
    working_dir: /app
    ports:
      - "4200:4200"
    command: ng serve --host 0.0.0.0
volumes:
  node_modules:
```

## Features

- **Alpine Linux** base for minimal image size
- **Non-root user** for security (runs as `node` user)
- **Persistent cache** volume at `/home/node/.cache`
- **Latest versions** of all tools are installed
- **Multi-architecture support** (automated builds)

## Build Information

The image is automatically built and published via GitHub Actions with the following schedule:
- On every push to the `main` branch
- Daily at 3 AM UTC
- On pull requests for testing

## Source Code

The source code and Dockerfiles are available on [GitHub](https://github.com/jessie-ai/angular-cli-firebase-tools).

## Docker Hub

The image can be pulled from [Docker Hub](https://hub.docker.com/r/jessieai/angular-cli-firebase-tools/).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms specified in the LICENSE file.
