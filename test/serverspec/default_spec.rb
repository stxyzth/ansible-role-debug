require 'spec_helper'

describe command('pip list') do
  its(:stdout) { should match /epdb \([0-9\.]+\)/ }
end
