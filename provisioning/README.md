Ansible 
=======

## user

自分のアカウントを作る。
公開鍵は GitHub からダウンロードして入れる。
`group_vars/all` にユーザ名と仮パスワードを入れてある。

## roles

### nginx

- トップページの設定
- リバースプロキシの設定

### rbenv

rbenv の role を ansible-galaxy から取ってくる。

```sh
ansible-galaxy install --roles-path ./roles zzet.rbenv
```

### Let's Encrypt

role を ansible-galaxy から取ってくる。

```sh
ansible-galaxy install --roles-path ./roles thefinn93.letsencrypt
```

実行ファイルは ``/usr/local/share/letsencrypt/env`` にできる。

