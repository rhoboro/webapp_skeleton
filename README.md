# はじめに

Webアプリ(主にAPIサーバー)のプロジェクト構成のスケルトンです。

## 開発

### 実行手順

どちらの場合も[127.0.0.1:5000](http://127.0.0.1:5000)で動きます

* Dockerを使う方法(推奨)

```sh
$ make dev
# テスト
$ make test
```

* 開発環境での実行方法

```sh
# 開発環境の設定ファイルを設定
$ python3 -m venv venv
$ . venv/bin/activate
(venv) $ pip install -r requirements.txt -c constraints.txt
(venv) $ export APP_CONFIG_FILE=`pwd`/config/development.py
(venv) $ export FLASK_DEBUG=1
(venv) $ cd src
(venv) $ python run.py
# テスト
(venv) $ pip install -r requirements_dev.txt
(venv) $ pytest -v
```

### 依存ライブラリの追加

1. 手動でインストールしたパッケージ名のみを requirements.txt に記載してください。(テストのみで利用するものは requirements_dev.txtへ)
2. `make constraints` を実行
