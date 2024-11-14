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
	if ! sudo apt install -y apache2; then
		echo "Failed to install apache2."
		exit 1
	fi
	# If the install is successful, the user is given a message.
	echo "Apache2 is now installed."
fi

# Test to see if squid is installed.
# If true, returns a message to the user.
if dpkg -l squid; then
	echo "Squid is already installed."
# If false, tells the user squid will now be installed.
else
	echo "Squid is not installed, installing now."
	# Installs squid. If it fails, the user is given an error message and the script exits.
	if ! sudo apt install -y squid; then
		echo "Failed to install squid."
		exit 1
	fi
	# If the install is successful, the user is given a message.
	echo "Squid is now installed."
fi


# Create new user accounts
# Create aubrey account if one doesn't exist.
if ! id "aubrey" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/aubrey -s /bin/bash aubrey
	echo "The user 'aubrey' has been added. Their home directory is /home/aubrey"
# If the account already exists, the user is informed.
else
	echo "User 'aubrey' already exists."
fi
