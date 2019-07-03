# Download ChefDK (chef workstation)
wget https://packages.chef.io/files/stable/chefdk/3.2.30/ubuntu/18.04/chefdk_3.2.30-1_amd64.deb

# Install
sudo dpkg -i chefdk_3.2.30-1_amd64.deb

# (Quick test) Generate a cookbook
chef generate cookbook test_cookbook

nano recipes/default.rb

# content
file "#{ENV['HOME']}/test.txt" do
    content 'This file was created by Chef!'
end

chef-client --local-mode --override-runlist first_cookbook
# I need config file...

# From the beginning: Create chef-repo (it is the area of the workstation where cookbooks are maintained)

chef generate repo chef-repo
cd chef-repo
mkdir .chef

nano .chef/config.rb

# Content:
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'ingram'
client_key               "#{current_dir}/ignacio.pem"
validation_client_name   'ingram-validator'
validation_key           "#{current_dir}/ORGANIZATION-validator.pem"
chef_server_url          'https://api.chef.io/organizations/ORG_NAME'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

# test default example
chef-client --local-mode --override-runlist example

# Print from stdout this message: INFO: Welcome to Chef, Sam Doe!

# I will modify default recipe file to try to write test.txt using chef...
nano cookbooks/example/recipes/default.rb

  # New content
  log "Welcome to Chef, #{node['example']['name']}!" do
    level :info
  end

  file "#{ENV['HOME']}/test.txt" do
      content 'This file was created by Chef!'
  end

# Test
chef-client --local-mode --override-runlist example

# And it works. This create a test.txt in my personal folder. So another success for the computer team.



# Now, i will test the chef docker module suggested

# Download docker cookbook from chef supermarket
knife cookbook site download docker
# Install
knife cookbook site install docker

# Add dependency to cookbook's example metadata.rb file
gedit cookbooks/example/metadata.rb &

  # New content
  depends 'docker'

# Add test to recipe
gedit cookbooks/example/recipes/default.rb &

  # New content
  docker_installation 'default' 

# Launch chef
chef-client --local-mode --override-runlist example

# And it works

# Second test
# Add new content to recipe

  # New content
  docker_image 'prestashop/prestashop' do
    action :pull
  end

  docker_container 'prestashop' do
    repo 'prestashop/prestashop'
    port '8080:80'
    action :run
  end

# Launch chef
chef-client --local-mode --override-runlist example

# Using testing tool...



##################################################################
# TODO: Learn about knife cli

# Knife CLI is an interface to manage nodes, cookbooks, roles...
knife user show ign

# Config file
knife.rb 