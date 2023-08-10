# python Flask Docker Workspace
Docker development environment for the flask projects based on Ubuntu 20.04 with SSH server and Ngrok installed.

## Table of Contents <!-- omit in toc -->
- [Usage](#usage)
    - [Show useful commands (inside the environment)](#show-useful-commands-inside-the-environment)
    - [Manage the image and container (outside the environment)](#manage-the-image-and-container-outside-the-environment)
    - [Network port mapping (host : container)](#network-port-mapping-host-container)
- [System prerequisites setup](#system-prerequisites-setup)
- [File structure](#file-structure)

## Usage
[ITH Workspace 操作說明(目前不可用)](https://playlab.computing.ncku.edu.tw:3001/3IiJDt-5Ri6pgIIAkoVgvw)

### Show useful commands (inside the environment)
```shell
$ startup
```

### Manage the image and container (outside the environment)
- Enter the workspace via [docker exec](https://docs.docker.com/engine/reference/commandline/exec/). Build a docker image first when needed.
    ```shell
    $ ./run --start
    ```
- Stop and exit the workspace.
    ```shell
    $ ./run --stop
    ```
- Remove the docker image.
    ```shell
    $ ./run --prune
    ```
- Remove the existing image and build a new one.
    ```shell
    $ ./run --rebuild
    ```

### Network port mapping (host : container)
- 5010 : 22 (used by SSH connection)
- 5000 : 5000 (reserved)
- 5001 : 5001 (reserved)

## System prerequisites setup
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/)
    - [Install Docker on Windows 10](https://playlab.computing.ncku.edu.tw:3001/s/G_eMBMGgS)
    - [Install Docker Desktop on Mac | Docker Documentation](https://docs.docker.com/desktop/install/mac-install/)
- [VS Code](https://code.visualstudio.com/download) or other IDEs that support container / SSH remote development are recommended.

## File structure
```
ITH Docker Workspace/
├── Dockerfile
├── projects/               # project repositories (mount to container)
├── run                     # workspace management script
├── scripts/
│   ├── .bashrc
│   ├── requirements.txt    # python package list
│   ├── start.sh            # execute when a container created
│   └── startup             # useful commands message
└── temp/
    ├── .ssh/               # the ssh key generated in the workspace (mount to container)
    ├── .vscode-server/     # remote dev server of VSCode (mount to container)
    └── ngrok/              # ngrok config files (mount to container)
```
