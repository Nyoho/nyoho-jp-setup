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
ansible-playbook -i vagrant_ansible_inventory_MyUbuntuServer -u ubuntu -s -vvv provisioning/playbook.yml
```

- 参考: http://docs.ansible.com/guide_vagrant.html


## Testing

serverspec でテスト

```
rake spec
```
