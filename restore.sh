
#!/bin/bash
# Bulletproof Restore Script (v2) - Created by The Maestro
set -e
REMOTE_SOURCE="gdrive:backups"
DESTINATION_DIRECTORY="/workspaces/vps-project-core/minecraft-server"
echo "--- Starting Automated Restore ---"
LATEST_BACKUP=$(rclone lsf "${REMOTE_SOURCE}/" | grep "mc-backup-" | sort -r | head -n 1)
if [ -z "$LATEST_BACKUP" ]; then
    echo "ERROR: No backups found!"
    exit 1
fi
SOURCE_PATH="${REMOTE_SOURCE}/${LATEST_BACKUP}"
echo "Restoring from: ${LATEST_BACKUP}"
rclone copy "$SOURCE_PATH" "$DESTINATION_DIRECTORY" -v
echo "--- Restore Finished Successfully ---"
