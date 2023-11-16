#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
  sudo apt install curl -y < "/dev/null"
fi
curl -s https://raw.githubusercontent.com/ngoikhoctrencay97/logo/main/logo.sh | bash
echo "==================================================="
sleep 2

# Menu

PS3='Select an action: '
options=(
"Install Node"
"Delete Node"
"Exit")
select opt in "${options[@]}"
do
case $opt in

"Install Node")
echo "******************************************"
echo -e "\e[1m\e[35m		Lets's begin\e[0m"
echo "******************************************"
echo -e "\e[1m\e[32m	Enter ALCHEMY_HTTP_ADDRESS:\e[0m"
echo "******************************************"
read ALCHEMY_HTTP_ADDRESS
echo "******************************************"
echo -e "\e[1m\e[35m	Enter CHAINSTACK_HTTP_ADDRESS:\e[0m"
echo "******************************************"
read CHAINSTACK_HTTP_ADDRESS
echo "******************************************"
echo export ALCHEMY_HTTP_ADDRESS=${ALCHEMY_HTTP_ADDRESS} >> $HOME/.bash_profile
echo export CHAINSTACK_HTTP_ADDRESS=${ALCHEMY_HTTP_ADDRESS} >> $HOME/.bash_profile
source ~/.bash_profile

echo -e "\e[1m\e[32m1. Updating packages and dependencies--> \e[0m" && sleep 1
#UPDATE APT
sudo apt update && sudo apt install --assume-yes build-essential git clang curl libssl-dev llvm libudev-dev git  make protobuf-compiler unzip
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node
nvm use node
nvm alias default node

echo -e "              \e[1m\e[32m2. Downloading and building binaries--> \e[0m" && sleep 1

#INSTALL
cd || return
npm install -g @holographxyz/cli
