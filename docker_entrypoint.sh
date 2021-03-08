#!/bin/sh
set -e
export LANG="zh_CN.UTF-8"
nohup python3 tg_username_update.py >> /Telegram-Name-Updating/logs/tg_username_update.log 2>&1 &
