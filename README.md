# Ubuntu Node.js Development Environment

This repository provides a Docker setup for creating a development environment based on Ubuntu Jammy (22.04) with Node.js and npm. It is tailored to streamline JavaScript development by including essential tools and configurations.

## Features

- **Ubuntu Jammy (22.04) base image**: Latest LTS version of Ubuntu for a stable and up-to-date environment.
- **Node.js and npm**: Installed via official package repositories for reliability and performance.
- **Essential development tools**: Includes `vim`, `sudo`, `make`, `gnupg`, `tree`, `wget`, `git`, `curl`, and `bash-completion`.
- **Developer user setup**: Configured `developer` user with sudo permissions.
- **Localization and timezone**: Set to `Europe/London` by default, can be changed as needed.

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/ivasik-k7/ubuntu-node.git repo && cd repo
   ```

2. **Build and run the Docker container:**

   ```sh
   docker-compose up --build
   ```

### Accessing the Development Environment

Once the container is up and running, you can access the development environment with:

```sh
docker exec -it {container-name} /bin/bash
```

This will open a bash session inside the container as the `developer` user.

## Configuration

### Environment Variables

- `USER`: The username for the development user (default: `developer`).
- `GROUP`: The group for the development user (default: `developers`).
- `UID`: The user ID for the development user (default: `1001`).
- `HOME`: The home directory for the development user (default: `/home/developer`).
- `DEBIAN_FRONTEND`: Set to `noninteractive` to avoid prompts during package installations.
- `TZ`: Timezone configuration (default: `Europe/London`).

### Customizing the Dockerfile

If you need to customize the Dockerfile, you can edit the provided Dockerfile to suit your needs. After making changes, rebuild the Docker image:

```sh
docker-compose build
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Maintainer

Developed and maintained by [Ivan Kovtun](mailto:ivan.kovtun@capgemini.com).

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
