require 'spec_helper'

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# nginx で ltsv log になっている
# nginx で nyoho.jp があって root が /var/www になっている
# /var/www の owner nyoho になっている
