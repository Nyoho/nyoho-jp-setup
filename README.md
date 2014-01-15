Vagrant でさくらのクラウドに Ubuntu 13.04 を up
================

さくらのクラウドに Ubuntu 13.10 の ISO パブリックイメージが入ったのはいいのですが
[13.04 がなくなってしまったの](http://cloud-news.sakura.ad.jp/2013/10/30/%E6%9C%AC%E6%97%A5%E3%80%81%E3%80%8C%E3%81%95%E3%81%8F%E3%82%89%E3%81%AE%E3%82%AF%E3%83%A9%E3%82%A6%E3%83%89%E3%80%8D%E3%81%A7%E5%88%A9%E7%94%A8%E3%81%A7%E3%81%8D%E3%82%8B%E3%83%91%E3%83%96%E3%83%AA/)ですが、なんと公式に[パブリックアーカイブを復活してくださいました!](http://kita.dyndns.org/diary/?date=20140107#p01)

## Setup

### 準備

```
vagrant plugin install vagrant-sakura
vagrant box add dummy https://github.com/tsahara/vagrant-sakura/raw/master/dummy.box
cp .env.template .env
edit .env
```

### vagrant up

```
eval `cat .env` vagrant up --provider=sakura
```

### 各種IDを調べる
```
eval `cat .env` vagrant sakuara-list-id
```

### 壊す
```
eval `cat .env` vagrant destroy
```

## Provisioning

### provision コマンドで
```
eval `cat .env` vagrant provision
```

### 手動で Ansible
```
ansible-playbook -i vagrant_ansible_inventory_MyUbuntuServer -u ubuntu -s -vvv provisioning/playbook.yml
```

- 参考: http://docs.ansible.com/guide_vagrant.html
