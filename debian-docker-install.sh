#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Step 1: Install required packages
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Step 2: Create directory for Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Step 3: Download Docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Step 4: Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Update package lists
sudo apt-get update

# Step 6: Install Docker and related components
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 7: Add current user to the docker group
sudo usermod -aG docker "$USER"

# Step 8: Print Docker version to confirm installation
docker --version

echo ""
echo "Docker was installed successfully."
echo "You have been added to the 'docker' group."
echo "You must log out and log back in (or reboot) for group changes to take effect."
