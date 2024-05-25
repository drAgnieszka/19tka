#!/bin/bash

# Directory where the Git repository is cloned
REPO_DIR="/home/buddy/github"
CRON_FILE="$REPO_DIR/cronjobs.txt"

# Pull the latest changes from the repository
cd "$REPO_DIR" || exit
git pull

# Update the cron jobs from the cronjobs.txt file in the repository
if [[ -f "$CRON_FILE" ]]; then
    crontab "$CRON_FILE"
    echo "Cron jobs updated successfully from $CRON_FILE."
else
    echo "Error: $CRON_FILE does not exist."
    exit 1
fi

