nyoho.jp を Vagrant up
================

nyoho.jp を vagrant up するためのレポジトリです。

- テスト用にローカルで VirtualBox に vagrant up
- 本番用にさくらのクラウドに vagrant up

としています。本番用は他のサービスも増やそうと思います。

## Setup

### 準備

```
vagrant plugin install vagrant-sakura
vagrant plugin install vagrant-digitalocean
vagrant plugin install dotenv
vagrant box add dummy https://github.com/tsahara/vagrant-sakura/raw/master/dummy.box
cp .env.template .env
edit .env
```

### vagrant up

```
vagrant up --provider=virtualbox
```

or

```
vagrant up --provider=sakura
```

or

```
vagrant up --provider=digital_ocean
```

### さくらのクラウドで各種IDを調べる
```
vagrant sakura-list-id
```

### 壊す
```
vagrant destroy
```

## Provisioning

今は Ansible でプロビジョニングを行っています。

### provision コマンドで
```
vagrant provision
```

### 手動で Ansible する
```
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -u ubuntu -s -vvv provisioning/playbook.yml
```

```
ansible-playbook -i provisioning/hosts provisioning/playbook.yml --ask-become-pass
```

- 参考: http://docs.ansible.com/guide_vagrant.html


## Testing

`provisioning/` ディレクトリで実行するようにしました。

`ansible_spec` でテスト

```
cd provisioning
env ASK_SUDO_PASSWORD=1 rake serverspec:Ansible-My-TDD
```

## Digital Ocean

```
ssh-keygen -t rsa -b 4096 -f ~/.ssh/for_digital_ocean.pem
```

して出来た .pub を [Account の Setings の Security](https://cloud.digitalocean.com/settings/security) の SSH Keys に登録。

```
vagrant plugin install vagrant-digitalocean
```
