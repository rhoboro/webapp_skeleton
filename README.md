# はじめに

Webアプリ(主にAPIサーバー)のプロジェクト構成のスケルトンです。  
src内のコードはFlaskを利用していますが、基本構成の方針自体はFlaskには依存しません。

## 設定情報

基本設定は、`src/config/default.py`に記載します。  
`APP_CONFIG_FILE`で(絶対パスで)指定したファイルで基本設定を上書きします。  
GCPを利用することが多いので`GOOGLE_APPLICATION_CREDENTIALS`も設定するようになっています。

## 開発

### 実行手順

どちらの場合も[127.0.0.1:5000](http://127.0.0.1:5000/api/index)で動きます

* Dockerを使う方法(推奨)

```sh
# 開発用設定で実行
$ make dev
...
docker run --rm -it -p 5000:5000 webapp_skeleton:0.1
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: xxx-xxx-xxx

# 本番設定で実行
$ make production
...
docker run --rm -it -p 5000:5000 -e "APP_CONFIG_FILE=/usr/src/app/config/production.py" webapp_skeleton:0.1
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```

* ホストマシンでの実行方法

```sh
# 開発環境の設定ファイルを設定
$ python3 -m venv venv
$ . venv/bin/activate
(venv) $ pip install -r requirements.txt -c constraints.txt
(venv) $ export APP_CONFIG_FILE=`pwd`/config/development.py
(venv) $ export FLASK_DEBUG=1
(venv) $ cd src
(venv) $ python run.py
```

### テスト

* Dockerを使う方法(推奨)

```sh
# テスト実行(pytest & flake8)
$ make test
...
docker run --rm -it -p 5000:5000 webapp_skeleton:0.1 pytest -v -m ""
=============================================================================== test session starts ================================================================================
platform linux -- Python 3.6.3, pytest-3.3.2, py-1.5.2, pluggy-0.6.0 -- /usr/local/bin/python
cachedir: .cache
rootdir: /usr/src/app, inifile:
collected 1 item

tests/api/test_views.py::ApiTestCase::test_index_api PASSED                                                                                                                  [100%]

============================================================================= 1 passed in 0.18 seconds =============================================================================
docker run --rm -it -p 5000:5000 webapp_skeleton:0.1 python -m flake8 --max-line-length=100
```

* ホストマシンでの実行方法

```sh
# テスト実行(pytest & flake8)
(venv) $ pip install -r requirements_dev.txt
(venv) $ pytest -v
```

### 依存ライブラリの追加

1. 手動でインストールしたパッケージ名のみを`requirements.txt`に記載してください。(テストのみで利用するものは`requirements_dev.txt`へ)
2. `make constraints` を実行

## ディレクトリ構成

```sh
$ tree .
.
├── Dockerfile
├── Makefile
├── README.md
├── constraints.txt
├── keys
│   └── credentials.json
├── requirements.txt
├── requirements_dev.txt
└── src
    ├── config
    │   ├── __init__.py
    │   ├── default.py
    │   ├── development.py
    │   └── production.py
    ├── run.py
    ├── server
    │   ├── __init__.py
    │   └── api
    │       ├── __init__.py
    │       └── views.py
    └── tests
        ├── __init__.py
        └── api
            ├── __init__.py
            └── test_views.py

7 directories, 18 files
```
