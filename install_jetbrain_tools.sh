#!/bin/bash

# Update system package index
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Ensure Snap is installed
echo "Checking for Snap..."
if ! command -v snap &> /dev/null; then
    echo "Snap is not installed. Installing Snap..."
    sudo apt install snapd -y
else
    echo "Snap is already installed."
fi

# Install IntelliJ IDEA Ultimate Edition
echo "Installing IntelliJ IDEA Ultimate Edition..."
sudo snap install intellij-idea-ultimate --classic

# Install DataGrip
echo "Installing DataGrip..."
sudo snap install datagrip --classic

# Install WebStorm
echo "Installing WebStorm..."
sudo snap install webstorm --classic

# Install Android Studio
echo "Installing Android Studio..."
sudo snap install android-studio --classic

# Final message
echo "Installation of JetBrains tools is complete!"
