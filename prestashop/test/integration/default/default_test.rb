# # encoding: utf-8

# Inspec test for recipe ingram::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# check whether Docker daemon is running

describe docker.info do
  its('Containers') { should eq '1' }
end

# check whether Prestashop container is running
docker.containers.running?.ids.each do 
  describe docker.object(1) do
    its('State.Health.Status') { should eq 'healthy' }
  end
end

# check whether Prestashop is listening on port 80
describe docker_container(name: 'prestashop') do
  its('ports') { should eq '0.0.0.0:80->80/tcp' }
end