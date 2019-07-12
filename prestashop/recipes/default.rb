#
# Cookbook:: prestashop
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

#For docker usage: https://github.com/chef-cookbooks/docker
docker_installation 'default'

docker_service 'default' do
  action [:create, :start]
end

#Webpage for Docker prestashop: https://hub.docker.com/r/prestashop/prestashop/
docker_image "prestashop/prestashop" do
    action :pull
end

docker_container "my_prestashop" do
    repo 'prestashop/prestashop'
    port '80:80'
    action :run
end 
