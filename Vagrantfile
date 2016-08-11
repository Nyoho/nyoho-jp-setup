Dotenv.load

vagrant_mode = "local"

# Vagrant.require_plugin('vagrant-serverspec')

Vagrant.configure("2") do |config|
  # config.vm.box = "dummy"
  # config.ssh.username = "ubuntu"
  # # config.ssh.username = "core"
  # config.ssh.private_key_path = File.expand_path "~/.ssh/id_dsa"

  config.vm.define "MyUbuntuServer"

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box = "ubuntu/trusty64"
    override.vm.network "forwarded_port", guest: 19292, host: 19292
    override.vm.network "private_network", ip: "192.168.33.10"
  end

  config.vm.provider :sakura do |sakura, override|
    override.vm.box = "dummy"
    override.ssh.username = "ubuntu"
    # override.ssh.username = "core"
    override.ssh.private_key_path = File.expand_path "~/.ssh/id_dsa"
    sakura.access_token = ENV['ACCESS_TOKEN']
    sakura.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    # sakura.disk_plan = "4"
    # sakura.disk_source_archive = "112500213364" # Ubuntu 13.04
    # sakura.disk_source_archive = "112600321612" # Ubuntu 14.04 (石狩第1)
    # sakura.disk_source_archive = "112600321618" # Ubuntu 14.04 (石狩第2)
    sakura.disk_source_archive = "112700955889" # Ubuntu 14.04 (石狩第2)
    # sakura.disk_source_archive = "112600545097" # Core OS
    # sakura.disk_source_archive = '112500570421' # CentOS 6.5
    # sakura.disk_source_archive = '112600078993' # FreeBSD 10.0 64bit (基本セット)
    sakura.server_plan = "1001"
    sakura.server_name = "UbuntuServer"
    sakura.sshkey_id = ENV['SSHKEY_ID']
    # sakura.use_insecure_key = true
    # sakura.zone_id = "is1a" # 石狩第1
    sakura.zone_id = "is1b" # 石狩第2
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.vm.hostname  = "vagrant-do-test"
    override.ssh.username = "ubuntu"
    # override.ssh.username         = ENV['DO_SSH_USERNAME']
    override.ssh.private_key_path = File.expand_path "~/.ssh/vagrant_do.pem"
    # override.ssh.private_key_path = ENV['DO_SSH_KEY']

    # provider.client_id = ENV['DO_CLIENT_ID']
    # provider.api_key = ENV['DO_API_KEY']
    provider.ssh_key_name = "vagrant_do"
    provider.token = ENV['DO_ACCESS_TOKEN']
    provider.image = 'ubuntu-16-04-x64'
    provider.region = 'sgp1' # Singapore 1
    # provider.region = 'nyc2' # New York 2
    provider.size = '512MB'

    provider.private_networking   = true
    # provider.ca_path              = "/usr/local/share/ca-bundle.crt"
    provider.setup                = true

    # disable synced_folder: rsync is not installed on DigitalOcean's guest machine
    override.vm.synced_folder "./", "/vagrant", disabled: true
  end

  config.vm.provision "ansible" do |ansible|
    # ansible.sudo = true
    # ansible.verbose = 'vvvv'
    ansible.playbook = "provisioning/playbook.yml"
  end

  # config.vm.provision :serverspec do |spec|
  #   spec.pattern = "spec/*/*_spec.rb"
  # end
end
