#!/bin/bash

# 应用数据库迁移
python3 manage.py migrate

# 如果需要，可以在这里添加其他初始化步骤

# 使用pydevd-pycharm启动Django开发服务器
python3 -m pydevd_pycharm --port 5678 --host 0.0.0.0 manage.py runserver 0.0.0.0:8000