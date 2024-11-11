#!/bin/bash

#1111111111111111111111111111111111111111111111111111111110001111111111111111
#1111111111111100011111111111111111111111111111111111111100000111111111111111
#1111111111111000001111111111111111111111111111111111111100000111111111111111
#1111111111110000000111111111111111111111111111111111111100000111111000111111
#1111111111111000000011111111111111111111111111111111111110001111111000111111
#1111111111111100000001111111111111111111111111111111111111111111110000111111
#1111111110011111100000111111111111111111111111111111111111111111110000111111
#1111111100001111110000011111111111111111111111111111111111111111000000000011
#1111111000000111111000001111111111111111100000000000011000000110000000000011
#1111110000000111111000000111111111111110000000000000011000000110000000000011
#1111100000000111111000000011111111111110000000000001111100000111100000111111
#1111000000000011111100000001111111111100000111100001111110000111100000111111
#1110000000000011111110000000111111111100001111110001111110000111100000111111
#1100000000000011101111110000011111111100001111110001111110000111100000111111
#1000000000000011100111111000001111111100001111100001111110000111100000111111
#1000000000000011100111111000000111111100000111000001111110000111100000111111
#1000000000000011100111111000001111111110000000000001111110000111100000111111
#1100000000000011100011111000011111111111000000000011111110000111100000111111
#1110000000000011100000100000111111111111000000011111111110000111100000111111
#1111000000000011100000000001111111111110001111111111111110000111100000111111
#1111100000000111110000000011111111111100000000111111111100000011110000000011
#1111110000000111111000000111111111111100000000000001111000000001110000000001
#1111111000000111111000001111111111111100000000000000111000000001111000000111
#1111111100000111110000011111111111111110000000000000011111111111111111111111
#1111111110000011100000111111111111111100011111110000011111111111111111111111
#1111111111000000000001111111111111111100011111111000011111111111111111111111
#1111111111100000000011111111111111111000011111110000011111111111111111111111
#1111111111110000000111111111111111111100000000000000111111111111111111111111
#1111111111111000001111111111111111111100000000000001111111111111111111111111
#1111111111111100011111111111111111111111100000001111111111111111111111111111
#1111111111111111111111111111111111111111111111111111111111111111111111111111


# SSH to the remote server (use appropriate username and host)
REMOTE_USER="your-username"
REMOTE_HOST="your-server.com"


# Ask the user to input the repository directory
read -p "Enter the Git repository directory: " REPO_DIR

# Connect to the server via SSH and run the commands
ssh "$REMOTE_USER@$REMOTE_HOST" << EOF
    # Navigate to the Git repository directory
    cd "$REPO_DIR" || exit

    # Show git status
    echo "Running git status..."
    git status
    echo "-----------------------------------------"
    
    # Stash any local changes
    echo "Running git stash..."
    git stash
    echo "-----------------------------------------"

    # Pull the latest changes from the remote repository
    echo "Running git pull..."
    git pull
    echo "-----------------------------------------"

    # Apply the stashed changes
    echo "Running git stash pop..."
    git stash pop
    echo "-----------------------------------------"

    # Reload PHP Octane (assuming you have PHP and Laravel Octane installed)
    echo "Running php artisan octane:reload..."
    php artisan octane:reload
EOF
