#!/bin/bash

# Ensure a directory path is provided as input
if [ -z "$1" ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

# Input directory
TARGET_DIR=$1

# Validate the input directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: $TARGET_DIR is not a valid directory."
  exit 1
fi

# Get the parent directory and backup file path
PARENT_DIR=$(dirname "$TARGET_DIR")
BACKUP_FILE="$PARENT_DIR/$(basename "$TARGET_DIR")_backup.tar.gz"

# Scan and secure files
echo "Scanning for insecure files in $TARGET_DIR..."
SECURED_FILES=0

while IFS= read -r -d '' file; do
  echo "Securing file: $file"
  chmod 640 "$file"
  ((SECURED_FILES++))
done < <(find "$TARGET_DIR" -type f -perm 777 -print0)

if [ "$SECURED_FILES" -eq 0 ]; then
  echo "No insecure files found."
else
  echo "$SECURED_FILES files were secured."
fi

# Create a backup of the directory
echo "Creating a backup of $TARGET_DIR..."
cd "$PARENT_DIR" && tar -czvf "$BACKUP_FILE" "$(basename "$TARGET_DIR")"

# Display the location of the backup file
if [ -f "$BACKUP_FILE" ]; then
  echo "Backup created successfully at: $BACKUP_FILE"
else
  echo "Error: Failed to create backup."
  exit 1
fi

