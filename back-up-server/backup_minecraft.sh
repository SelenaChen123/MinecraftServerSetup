TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_DIR="/home/opc/minecraft_backups"
WORLD_DIR="/home/opc/world"
BACKUP_FILE="$BACKUP_DIR/world_backup_$TIMESTAMP.tar.gz"

mkdir -p $BACKUP_DIR
tar -czvf $BACKUP_FILE $WORLD_DIR
find $BACKUP_DIR -type f -mtime +7 -name "*.tar.gz" -exec rm {} \;
