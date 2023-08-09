#!/bin/bash

# make these environment variable visibles in SSH shell
echo "EXPOSE_SSH_PORT=${EXPOSE_SSH_PORT}" | sudo tee -a /etc/environment
echo "EXPOSE_DEV_PORT_1=${EXPOSE_DEV_PORT_1}" | sudo tee -a /etc/environment
echo "EXPOSE_DEV_PORT_2=${EXPOSE_DEV_PORT_2}" | sudo tee -a /etc/environment

# start ssh service
sudo /usr/sbin/sshd -D &

# change owner and permission of volume folders
sudo chown "$(id -u)":"$(id -g)" /home/"$(id -un)"/.ssh &&
    chmod 755 /home/"$(id -un)"/.ssh &&
    chmod 644 /home/"$(id -un)"/.ssh/* &&
    chmod 600 /home/"$(id -un)"/.ssh/id_rsa
sudo chown "$(id -u)":"$(id -g)" /home/"$(id -un)"/.vscode-server && chmod 755 /home/"$(id -un)"/.vscode-server
sudo chown "$(id -u)":"$(id -g)" /home/"$(id -un)"/projects && chmod 755 /home/"$(id -un)"/projects

# keep the container running
tail -f /dev/null
