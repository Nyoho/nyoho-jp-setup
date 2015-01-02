require 'spec_helper'

describe service('ssh') do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  its(:content) { should match %r|PermitRootLogin no| }
end

describe file('/etc/ssh/sshd_config') do
  its(:content) { should match %r|PasswordAuthentication no| }
end
