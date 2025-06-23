
#!/bin/bash
# Bulletproof Backup Script (v2) - Created by The Maestro
set -e
SOURCE_DIRECTORY="/workspaces/vps-project-core/minecraft-server"
REMOTE_DESTINATION="gdrive:backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FINAL_DESTINATION="${REMOTE_DESTINATION}/mc-backup-${TIMESTAMP}"
echo "--- Starting Automated Backup ---"
if [ ! -d "$SOURCE_DIRECTORY" ]; then
    echo "ERROR: Source directory '${SOURCE_DIRECTORY}' not found!"
    exit 1
fi
rclone copy "$SOURCE_DIRECTORY" "$FINAL_DESTINATION" --create-empty-src-dirs -v
echo "--- Backup Finished Successfully ---"
