#!/bin/bash

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