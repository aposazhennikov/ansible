#!/bin/bash

# Генерация ключей
ssh-keygen -t rsa -N "" -f "shared_key"

# Чтение файла с учетными данными
while IFS=';' read -r ip_address login password; do
  # Копирование публичного ключа на удаленный сервер
  sshpass -p "$password" ssh-copy-id -i "shared_key.pub" "$login"@"$ip_address"
done < credentials_file.txt


#Этот Bash скрипт открывает файл credentials_file.txt в котором лежат данные для входа по ssh на серверы в виде:
# IP;LOGIN;PASSWORD Например 127.0.0.1;test;qwerty123 и создает ssh key для них(один для всех), копирует публичный ключ на эти сервера
