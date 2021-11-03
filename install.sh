#!/bin/bash
echo "Suicide Linux non-docker Installation"
echo ""
echo "WARNING: This will install SuicideLinux on your system, proceed with caution."
echo "WARNING: This will delete all your files if a invalid command is entered."
echo "WARNING: You have been warned."
read -p "Press [Enter] key to start installation or press Ctrl-C or Ctrl-Z to halt."
mv ~/.bashrc ~/.bashrc.backup
cp bash.bashrc ~/.bashrc
read -t 5 -p "Suicide Linux Installed. Logging you out..."
logout
