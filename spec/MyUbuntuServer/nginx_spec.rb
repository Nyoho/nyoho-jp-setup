require 'spec_helper'

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# nginx で ltsv log になっている
describe file('/etc/nginx/nginx.conf') do
  its(:content) { should match %r|access_log /var/log/nginx/access.log ltsv;| }
end

# nginx で nyoho.jp があって root が /var/www になっている
describe file('/etc/nginx/sites-available/nyoho.jp') do
  it { should be_file }
end
describe file('/etc/nginx/sites-enabled/nyoho.jp') do
  it { should be_symlink }
end
describe file('/etc/nginx/sites-available/nyoho.jp') do
  its(:content) { should match %r|root /var/www/nyoho.jp;| }
end

# /var/www/nyoho.jp が存在して owner が nyoho になっている
describe file('/var/www/nyoho.jp') do
  it { should be_directory }
end
describe command('ls -ld /var/www/nyoho.jp') do
  its(:stdout) { should match /2 nyoho/ }
end
