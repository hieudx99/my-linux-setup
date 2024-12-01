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