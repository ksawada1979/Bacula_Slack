#!/bin/sh

#スクリプトを配置するrootディレクトリ
ROOT=/root/slack

#baculaのジョブ実行情報を取得
$ROOT/bacula.sh > $ROOT/bacula_status

#当日の情報だけを抜粋
$ROOT/today.sh

#ファイルの改行コードを変換
tr -d '\r' < $ROOT/bacula_status_today > $ROOT/bacula_result

# baculaのジョブ実行結果をslackに送信
$ROOT/slack.sh $ROOT/bacula_result
