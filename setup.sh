#!/bin/bash

RED='\033[0;31m';
NC='\033[0m'; # No Color
GREEN='\033[0;32m';
YELLOW='\033[1;33m';

CWD=`pwd`;

delay_after_message=3;
target_user=hieudx;

# function to run command as non-root user
run_as_user() {
	sudo -u $target_user bash -c "$1";
}

#git config
printf "${YELLOW}config git${NC}\n";
git config --global user.email "hieudx1104@gmail.com" 
git config --global user.name "hieudx99"

# chrome
printf "${YELLOW}Installing chrome${NC}\n";
sleep $delay_after_message;
sudo apt update -y 
sudo apt install wget -y 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
printf "${YELLOW}Installing chrome DONE!!!${NC}\n";


# curl
printf "${YELLOW}Installing curl${NC}\n";
sleep $delay_after_message;
sudo apt install curl -y;

# Gnome tweak tool
printf "${YELLOW}Installing gnome-tweak-tool${NC}\n";
sleep $delay_after_message;
sudo apt install gnome-tweaks -y;

# Change backgound
printf "${YELLOW}Changing backgound${NC}\n";
sleep $delay_after_message;
sudo apt install dbus-x11;
cp 11-0-Color-Day.jpg ~/Pictures;
cp 12-Light.jpg ~/Pictures;
gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/12-Light.jpg";

printf "${YELLOW}Install prerequisits for Gnome Shell Extentions${NC}\n";
sleep $delay_after_message;
sudo apt install gnome-shell-extensions -y
sudo apt install chrome-gnome-shell -y

# flamshot
printf "${YELLOW}Installing flameshot${NC}\n";
sudo apt install flameshot -y;

# vscode
printf "${YELLOW}Installing vscode${NC}\n";
sudo apt install software-properties-common apt-transport-https wget -y;
wget -O- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg;
echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list;
sudo apt update;
sudo apt install code -y;


# java
printf "${YELLOW}Installing java${NC}\n";
sudo apt update;
sudo apt install openjdk-17-jdk -y;

#maven
printf "${YELLOW}Installing maven${NC}\n";
sudo apt update;
sudo apt install maven -y;


# 1. Download Postman
echo "Downloading Postman..."
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz

# 2. Extract Postman
echo "Extracting Postman..."
sudo tar -xzf postman.tar.gz -C /opt/

# 3. Create symlink
echo "Creating symlink..."
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# 4. Create desktop entry
echo "Creating desktop entry..."
cat << EOF > ~/.local/share/applications/postman.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Postman
X-GNOME-FullName=Postman API Client
Exec=/usr/bin/postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF

echo "Postman installation complete!"


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


# plank dock

printf "${YELLOW}remove gnome dock${NC}\n";
sudo apt remove gnome-shell-extension-ubuntu-dock

printf "${YELLOW}Installing plank dock${NC}\n";
sudo apt update;
sudo apt install plank -y;

printf "${YELLOW}clone plank themes${NC}\n";
git clone https://github.com/erikdubois/plankthemes.git

# OnlyOffice 
printf "${YELLOW}Installing onlyoffice${NC}\n";
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -y
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb

printf "${YELLOW}DONE!!!${NC}\n";