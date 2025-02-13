#docker
printf "${YELLOW}Installing docker${NC}\n";
# Update package index
sudo apt update

# Install required packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
sudo apt update

# Check available Docker versions
apt-cache policy docker-ce

# Install Docker
sudo apt install -y docker-ce

# Check Docker status
sudo systemctl status docker

# Add current user to docker group
sudo usermod -aG docker ${USER}

# Activate changes to groups
newgrp docker

echo "Docker installation completed! Please log out and log back in for group changes to take effect."