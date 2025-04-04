#!/bin/bash
set -e
SSH_HOST=$1
SSH_PORT=$2
SSH_USER=$3


rsync -avz --progress --delete -e "ssh -i ./upload.key -p$SSH_PORT -o StrictHostKeyChecking=accept-new" build $SSH_USER@$SSH_HOST:/home/$SSH_USER/upload
ssh -i ./upload.key -p$SSH_PORT $SSH_USER@$SSH_HOST /home/$SSH_USER/deploy.sh
