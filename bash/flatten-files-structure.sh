#!/bin/bash

# Define the path to your dotfiles
DOTFILES_DIR=~/Github/dotfiles

# Array of application directories to flatten
apps=("nvim" "kitty" "hypr" "waybar" "wofi")

# Move files out of .config format
for app in "${apps[@]}"; do
    # Check if the .config folder for the app exists
    if [ -d "$DOTFILES_DIR/$app/.config/$app" ]; then
        echo "Moving files for $app..."
        # Create the app directory if it doesn't exist
        mkdir -p "$DOTFILES_DIR/$app"
        # Move files up one level
        mv "$DOTFILES_DIR/$app/.config/$app/"* "$DOTFILES_DIR/$app/"
        # Remove the empty .config directory
        rm -rf "$DOTFILES_DIR/$app/.config"
    else
        echo "No .config structure found for $app; skipping."
    fi
done

echo "All files moved out of .config structure!"

