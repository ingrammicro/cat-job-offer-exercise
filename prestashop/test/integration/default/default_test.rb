# # encoding: utf-8

# Inspec test for recipe prestashop::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe docker_container(name: 'my_prestashop') do
    it { should exist }
end

describe docker_container(name: 'my_prestashop') do
    its('ports') {should eq '0.0.0.0:80->80/tcp'}
end
