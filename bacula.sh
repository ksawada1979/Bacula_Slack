#! /usr/bin/expect -f

#bconsole起動
spawn /usr/sbin/bconsole

# statusコマンド実行
expect "\*:" {send "status\n"}

# 3を選択しクライアント情報を出力
expect "Select daemon type for status (1-5):" {send "3\n"}

expect exit
