#!/bin/bash

# Test to see if apache2 is installed.
# If true, returns a message to the user.
if dpkg -l apache2; then
	echo "Apache2 is already installed."
# If false, tells the user apache2 will now be installed.
else
	echo "Apache2 is not installed, installing now."
	# Updates the package repo. If it fails, the user is given an error message and the script exits.
	if ! sudo apt update; then
		echo "Failed to update package list."
		exit 1
	fi
	# Installs apache2. If it fails, the user is given an error message and the script exits.
	if ! sudo apt install apache2; then
		echo "Failed to install apache2."
		exit 1
	fi
	# If the install is successful, the user is given a message.
	echo "Apache2 is now installed."
fi
