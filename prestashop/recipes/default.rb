#
# Cookbook:: prestashop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


# Install docker with docker cookbooks
docker_installation 'default'

# pull prestashop image
docker_image "prestashop/prestashop" do
    tag 'latest'
    action :pull
end

# Create and run prestashop container
docker_container "my_prestashop" do
    repo 'prestashop/prestashop'
    tag 'latest'
    port '80:80'
    action :run
end