require 'spec_helper'

describe 'nodejs-chef::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  # binaries
  describe command('which node') do
    its(:stdout) { should match /\/bin\/node/ }
  end
  describe command('which pm2') do
    its(:stdout) { should match /\/bin\/pm2/ }
  end
end
