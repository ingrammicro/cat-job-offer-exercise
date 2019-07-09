# # encoding: utf-8

# Inspec test for recipe prestashop::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


# verify docker instalation
describe docker.version do
    its('Server.Version') { should cmp >= '0.0'}
    its('Client.Version') { should cmp >= '0.0'}
end



# check instalation of prestashop and listening port
describe docker_container(name: 'my_prestashop') do
    it { should exist }
    its('ports') {should eq '0.0.0.0:80->80/tcp'}
  end