REMOTE_SERVER="opc@<PUBLIC_IP_ADDRESS>"
SSH_KEY_FILE="~/.ssh/<PRIVATE_SSH_KEY_NAME>"
REMOTE_DIR="/home/opc/minecraft_backups"
LOCAL_DIR="<BACKUPS_FOLDER>"

LATEST_BACKUP=$(ssh -i "$SSH_KEY_FILE" "$REMOTE_SERVER" "ls -t $REMOTE_DIR/*.tar.gz | head -n 1")

if [ -z "$LATEST_BACKUP" ]; then
  exit 1
fi

LATEST_BACKUP_FILE=$(basename "$LATEST_BACKUP")

scp -i "$SSH_KEY_FILE" "$REMOTE_SERVER:$LATEST_BACKUP" "$LOCAL_DIR"

find "$LOCAL_DIR" -name "*.tar.gz" -not -name "$LATEST_BACKUP_FILE" -type f -delete
