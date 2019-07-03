
# Install Docker in the machine with Chef-Docker cookbook resources mentioned earlier
docker_installation 'default'

# Download the Prestashop container using Chef-Docker resources
docker_container 'prestashop' do
  repo 'prestashop/prestashop'
  action :create
end

# Run the Prestashop container using Chef-Docker resources
docker_container 'prestashop' do
  action :run
end