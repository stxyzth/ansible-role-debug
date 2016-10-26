require 'spec_helper'

describe command('pip list') do
  its(:stdout) { should match /epdb \([0-9\.]+\)/ }
end

describe file('/var/log/ansible_variables') do
  it { should be_file }
end
