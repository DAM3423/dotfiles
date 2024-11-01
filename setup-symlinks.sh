#!/bin/bash

# Define the path to your dotfiles
DOTFILES_DIR=~/Github/dotfiles

# Array of application directories to symlink
apps=("nvim" "kitty" "hypr" "waybar" "wofi")

# Loop through each application and set up the symlink
for app in "${apps[@]}"; do
    # Check if the target link already exists and remove it
    TARGET_PATH="$HOME/.config/$app"
    if [ -e "$TARGET_PATH" ] || [ -L "$TARGET_PATH" ]; then
        echo "Removing existing $TARGET_PATH..."
        rm -rf "$TARGET_PATH"
    fi

    # Create the symlink
    echo "Creating symlink for $app..."
    ln -s "$DOTFILES_DIR/$app" "$TARGET_PATH"
done

echo "Symlinks created successfully!"

