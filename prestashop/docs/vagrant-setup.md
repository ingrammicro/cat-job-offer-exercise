# Install vagrant
sudo apt update
sudo apt install vagrant

vagrant --version   # version 2.0.2

mkdir vagrant-ubuntu
cd vagrant-ubuntu

# Create vagrant file
vagrant init ubuntu/bionic64

vagrant up --provider virtualbox

# First problem: i have a version of VirtualBox installed that is not supported by this vagrant version. So i will download the latest vagrant version from hashicorp website.

sudo apt purge vagrant

sudo dpkg -i vagrant_2.2.5_x86_64.deb

vagrant --version   # version 2.2.5

vagrant up --provider virtualbox    # now it works
