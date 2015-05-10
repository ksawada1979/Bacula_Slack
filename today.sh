#!/usr/bin/bash

#スクリプトを配置するrootディレクトリ
ROOT=/root/slack

#日付情報取得
DATE=`date +"%d-"`

#baculaのジョブ実行情報を当日分だけ抜粋
cat $ROOT/bacula_status | grep $DATE > $ROOT/bacula_status_today
