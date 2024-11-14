#!/bin/bash

# Test to see if apache2 is installed.
# If true, returns a message to the user.
if dpkg -l | grep -q apache2; then
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
if dpkg -l | grep -q squid; then
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
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/aubrey/.ssh" ]; then
	sudo mkdir -p /home/aubrey/.ssh
	sudo chmod 700 /home/aubrey/.ssh
	echo "/home/aubrey/.ssh directory has been created."
else
	echo "/home/aubrey/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/aubrey/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/aubrey/.ssh/id_rsa -N ""
	echo "RSA key has been generated for aubrey."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/aubrey/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/aubrey/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for aubrey."
fi
# Set permissions for the keys
sudo chmod 600 /home/aubrey/.ssh/id_rsa /home/aubrey/.ssh/id_ed25519
sudo chmod 644 /home/aubrey/.ssh/id_rsa.pub /home/aubrey/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/aubrey/.ssh/id_rsa.pub | sudo tee -a /home/aubrey/.ssh/authorized_keys
cat /home/aubrey/.ssh/id_ed25519.pub | sudo tee -a /home/aubrey/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/aubrey/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to aubrey
sudo chown -R aubrey:aubrey /home/aubrey/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for aubrey."
# Create captain account if one doesn't exist.
if ! id "captain" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/captain -s /bin/bash captain
	echo "The user 'captain' has been added. Their home directory is /home/captain"
# If the account already exists, the user is informed.
else
	echo "User 'captain' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/captain/.ssh" ]; then
	sudo mkdir -p /home/captain/.ssh
	sudo chmod 700 /home/captain/.ssh
	echo "/home/captain/.ssh directory has been created."
else
	echo "/home/captain/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/captain/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/captain/.ssh/id_rsa -N ""
	echo "RSA key has been generated for captain."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/captain/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/captain/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for captain."
fi
# Set permissions for the keys
sudo chmod 600 /home/captain/.ssh/id_rsa /home/captain/.ssh/id_ed25519
sudo chmod 644 /home/captain/.ssh/id_rsa.pub /home/captain/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/captain/.ssh/id_rsa.pub | sudo tee -a /home/captain/.ssh/authorized_keys
cat /home/captain/.ssh/id_ed25519.pub | sudo tee -a /home/captain/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/captain/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to captain
sudo chown -R captain:captain /home/captain/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for captain."
# Create snibbles account if one doesn't exist.
if ! id "snibbles" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/snibbles -s /bin/bash snibbles
	echo "The user 'snibbles' has been added. Their home directory is /home/snibbles"
# If the account already exists, the user is informed.
else
	echo "User 'snibbles' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/snibbles/.ssh" ]; then
	sudo mkdir -p /home/snibbles/.ssh
	sudo chmod 700 /home/snibbles/.ssh
	echo "/home/snibbles/.ssh directory has been created."
else
	echo "/home/snibbles/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/snibbles/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/snibbles/.ssh/id_rsa -N ""
	echo "RSA key has been generated for snibbles."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/snibbles/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/snibbles/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for snibbles."
fi
# Set permissions for the keys
sudo chmod 600 /home/snibbles/.ssh/id_rsa /home/snibbles/.ssh/id_ed25519
sudo chmod 644 /home/snibbles/.ssh/id_rsa.pub /home/snibbles/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/snibbles/.ssh/id_rsa.pub | sudo tee -a /home/snibbles/.ssh/authorized_keys
cat /home/snibbles/.ssh/id_ed25519.pub | sudo tee -a /home/snibbles/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/snibbles/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to snibbles
sudo chown -R snibbles:snibbles /home/snibbles/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for snibbles."
# Create brownie account if one doesn't exist.
if ! id "brownie" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/brownie -s /bin/bash brownie
	echo "The user 'brownie' has been added. Their home directory is /home/brownie"
# If the account already exists, the user is informed.
else
	echo "User 'brownie' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/brownie/.ssh" ]; then
	sudo mkdir -p /home/brownie/.ssh
	sudo chmod 700 /home/brownie/.ssh
	echo "/home/brownie/.ssh directory has been created."
else
	echo "/home/brownie/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/brownie/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/brownie/.ssh/id_rsa -N ""
	echo "RSA key has been generated for brownie."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/brownie/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/brownie/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for brownie."
fi
# Set permissions for the keys
sudo chmod 600 /home/brownie/.ssh/id_rsa /home/brownie/.ssh/id_ed25519
sudo chmod 644 /home/brownie/.ssh/id_rsa.pub /home/brownie/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/brownie/.ssh/id_rsa.pub | sudo tee -a /home/brownie/.ssh/authorized_keys
cat /home/brownie/.ssh/id_ed25519.pub | sudo tee -a /home/brownie/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/brownie/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to brownie
sudo chown -R brownie:brownie /home/brownie/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for brownie."
# Create scooter account if one doesn't exist.
if ! id "scooter" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/scooter -s /bin/bash scooter
	echo "The user 'scooter' has been added. Their home directory is /home/scooter"
# If the account already exists, the user is informed.
else
	echo "User 'scooter' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/scooter/.ssh" ]; then
	sudo mkdir -p /home/scooter/.ssh
	sudo chmod 700 /home/scooter/.ssh
	echo "/home/scooter/.ssh directory has been created."
else
	echo "/home/scooter/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/scooter/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/scooter/.ssh/id_rsa -N ""
	echo "RSA key has been generated for scooter."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/scooter/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/scooter/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for scooter."
fi
# Set permissions for the keys
sudo chmod 600 /home/scooter/.ssh/id_rsa /home/scooter/.ssh/id_ed25519
sudo chmod 644 /home/scooter/.ssh/id_rsa.pub /home/scooter/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/scooter/.ssh/id_rsa.pub | sudo tee -a /home/scooter/.ssh/authorized_keys
cat /home/scooter/.ssh/id_ed25519.pub | sudo tee -a /home/scooter/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/scooter/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to scooter
sudo chown -R scooter:scooter /home/scooter/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for scooter."
# Create sandy account if one doesn't exist.
if ! id "sandy" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/sandy -s /bin/bash sandy
	echo "The user 'sandy' has been added. Their home directory is /home/sandy"
# If the account already exists, the user is informed.
else
	echo "User 'sandy' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/sandy/.ssh" ]; then
	sudo mkdir -p /home/sandy/.ssh
	sudo chmod 700 /home/sandy/.ssh
	echo "/home/sandy/.ssh directory has been created."
else
	echo "/home/sandy/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/sandy/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/sandy/.ssh/id_rsa -N ""
	echo "RSA key has been generated for sandy."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/sandy/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/sandy/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for sandy."
fi
# Set permissions for the keys
sudo chmod 600 /home/sandy/.ssh/id_rsa /home/sandy/.ssh/id_ed25519
sudo chmod 644 /home/sandy/.ssh/id_rsa.pub /home/sandy/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/sandy/.ssh/id_rsa.pub | sudo tee -a /home/sandy/.ssh/authorized_keys
cat /home/sandy/.ssh/id_ed25519.pub | sudo tee -a /home/sandy/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/sandy/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to sandy
sudo chown -R sandy:sandy /home/sandy/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for sandy."
# Create perrier account if one doesn't exist.
if ! id "perrier" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/perrier -s /bin/bash perrier
	echo "The user 'perrier' has been added. Their home directory is /home/perrier"
# If the account already exists, the user is informed.
else
	echo "User 'perrier' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/perrier/.ssh" ]; then
	sudo mkdir -p /home/perrier/.ssh
	sudo chmod 700 /home/perrier/.ssh
	echo "/home/perrier/.ssh directory has been created."
else
	echo "/home/perrier/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/perrier/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/perrier/.ssh/id_rsa -N ""
	echo "RSA key has been generated for perrier."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/perrier/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/perrier/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for perrier."
fi
# Set permissions for the keys
sudo chmod 600 /home/perrier/.ssh/id_rsa /home/perrier/.ssh/id_ed25519
sudo chmod 644 /home/perrier/.ssh/id_rsa.pub /home/perrier/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/perrier/.ssh/id_rsa.pub | sudo tee -a /home/perrier/.ssh/authorized_keys
cat /home/perrier/.ssh/id_ed25519.pub | sudo tee -a /home/perrier/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/perrier/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to perrier
sudo chown -R perrier:perrier /home/perrier/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for perrier."
# Create cindy account if one doesn't exist.
if ! id "cindy" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/cindy -s /bin/bash cindy
	echo "The user 'cindy' has been added. Their home directory is /home/cindy"
# If the account already exists, the user is informed.
else
	echo "User 'cindy' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/cindy/.ssh" ]; then
	sudo mkdir -p /home/cindy/.ssh
	sudo chmod 700 /home/cindy/.ssh
	echo "/home/cindy/.ssh directory has been created."
else
	echo "/home/cindy/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/cindy/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/cindy/.ssh/id_rsa -N ""
	echo "RSA key has been generated for cindy."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/cindy/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/cindy/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for cindy."
fi
# Set permissions for the keys
sudo chmod 600 /home/cindy/.ssh/id_rsa /home/cindy/.ssh/id_ed25519
sudo chmod 644 /home/cindy/.ssh/id_rsa.pub /home/cindy/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/cindy/.ssh/id_rsa.pub | sudo tee -a /home/cindy/.ssh/authorized_keys
cat /home/cindy/.ssh/id_ed25519.pub | sudo tee -a /home/cindy/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/cindy/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to cindy
sudo chown -R cindy:cindy /home/cindy/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for cindy."
# Create tiger account if one doesn't exist.
if ! id "tiger" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/tiger -s /bin/bash tiger
	echo "The user 'tiger' has been added. Their home directory is /home/tiger"
# If the account already exists, the user is informed.
else
	echo "User 'tiger' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/tiger/.ssh" ]; then
	sudo mkdir -p /home/tiger/.ssh
	sudo chmod 700 /home/tiger/.ssh
	echo "/home/tiger/.ssh directory has been created."
else
	echo "/home/tiger/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/tiger/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/tiger/.ssh/id_rsa -N ""
	echo "RSA key has been generated for tiger."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/tiger/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/tiger/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for tiger."
fi
# Set permissions for the keys
sudo chmod 600 /home/tiger/.ssh/id_rsa /home/tiger/.ssh/id_ed25519
sudo chmod 644 /home/tiger/.ssh/id_rsa.pub /home/tiger/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/tiger/.ssh/id_rsa.pub | sudo tee -a /home/tiger/.ssh/authorized_keys
cat /home/tiger/.ssh/id_ed25519.pub | sudo tee -a /home/tiger/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/tiger/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to tiger
sudo chown -R tiger:tiger /home/tiger/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for tiger."
# Create yoda account if one doesn't exist.
if ! id "yoda" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/yoda -s /bin/bash yoda
	echo "The user 'yoda' has been added. Their home directory is /home/yoda"
# If the account already exists, the user is informed.
else
	echo "User 'yoda' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/yoda/.ssh" ]; then
	sudo mkdir -p /home/yoda/.ssh
	sudo chmod 700 /home/yoda/.ssh
	echo "/home/yoda/.ssh directory has been created."
else
	echo "/home/yoda/.ssh directory already exists."
fi
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/yoda/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/yoda/.ssh/id_rsa -N ""
	echo "RSA key has been generated for yoda."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/yoda/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/yoda/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for yoda."
fi
# Set permissions for the keys
sudo chmod 600 /home/yoda/.ssh/id_rsa /home/yoda/.ssh/id_ed25519
sudo chmod 644 /home/yoda/.ssh/id_rsa.pub /home/yoda/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/yoda/.ssh/id_rsa.pub | sudo tee -a /home/yoda/.ssh/authorized_keys
cat /home/yoda/.ssh/id_ed25519.pub | sudo tee -a /home/yoda/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/yoda/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to yoda
sudo chown -R yoda:yoda /home/yoda/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for yoda."
# Create dennis account if one doesn't exist.
if ! id "dennis" &>/dev/null; then
	# creates and specifies the user's home directory, and specifies bash as the default shell. Returns a success message to the user.
	sudo useradd -m -d /home/dennis -s /bin/bash dennis
	echo "The user 'dennis' has been added. Their home directory is /home/dennis"
# If the account already exists, the user is informed.
else
	echo "User 'dennis' already exists."
fi
# Create the .ssh directory with user rwx permissions if it doesn't already exist
if [ ! -d "/home/dennis/.ssh" ]; then
	sudo mkdir -p /home/dennis/.ssh
	sudo chmod 700 /home/dennis/.ssh
	echo "/home/dennis/.ssh directory has been created."
else
	echo "/home/dennis/.ssh directory already exists."
fi
# Give the user sudo access
sudo usermod -aG sudo dennis
# Generate the rsa key pair if it doesn't already exist.
if [ ! -f /home/dennis/.ssh/id_rsa ]; then
	sudo ssh-keygen -t rsa -b 4096 -f /home/dennis/.ssh/id_rsa -N ""
	echo "RSA key has been generated for dennis."
fi
# Create the ed25519 key pair if it doesn't already exist.
if [ ! -f /home/dennis/.ssh/id_ed25519 ]; then
	sudo ssh-keygen -t ed25519 -f /home/dennis/.ssh/id_ed25519 -N ""
	echo "ED25519 key has been generated for dennis."
fi
# Set permissions for the keys
sudo chmod 600 /home/dennis/.ssh/id_rsa /home/dennis/.ssh/id_ed25519
sudo chmod 644 /home/dennis/.ssh/id_rsa.pub /home/dennis/.ssh/id_ed25519.pub
# Add public keys to authorized_keys
cat /home/dennis/.ssh/id_rsa.pub | sudo tee -a /home/dennis/.ssh/authorized_keys
cat /home/dennis/.ssh/id_ed25519.pub | sudo tee -a /home/dennis/.ssh/authorized_keys
# Set permissions for authorized_keys
sudo chmod 600 /home/dennis/.ssh/authorized_keys
# Sets owner of /.ssh and its contents to dennis
sudo chown -R dennis:dennis /home/dennis/.ssh
# Returns a confirmation message
echo "SSH and ED25519 keys have been generated and added to authorized_users for dennis."
