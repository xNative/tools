#!/bin/bash

# Backup the original sshd_config file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Use sed to uncomment and set PermitRootLogin to yes 
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Check for successful modification of PermitRootLogin
if grep -q "^PermitRootLogin yes" /etc/ssh/sshd_config; then
  echo "PermitRootLogin enabled successfully!"
else
  echo "Error: PermitRootLogin not found in /etc/ssh/sshd_config"
  # Restore the backup if modification failed (optional)
  # sudo cp /etc/ssh/sshd_config.bak /etc/ssh/sshd_config
fi

# Set default timezone to Asia/Bangkok
sudo timedatectl set-timezone Asia/Bangkok

# Test the timezone change and display date/time in readable format
echo "**Current Timezone:**"
timedatectl

echo "**Current Date and Time (Asia/Bangkok):**"
date +"%Y-%m-%d %H:%M:%S"  # Example format: 2024-03-26 18:33:23

# Restart ssh service for changes to take effect (may vary depending on system)
sudo systemctl restart sshd
