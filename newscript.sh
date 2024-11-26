#!/bin/bash

# Директории для бэкапа
SOURCE_DIRS=("/opt" "/home/ec2-user")

# Каталог, где будут храниться бэкапы
BACKUP_DIR="/backups"

# Максимальное количество бэкапов
MAX_BACKUPS=3

# Имя архива с текущей датой
BACKUP_NAME="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Создаем каталог для бэкапов, если он не существует
mkdir -p "$BACKUP_DIR"

# Архивируем директории
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "${SOURCE_DIRS[@]}"

# Удаляем старые бэкапы, если их больше $MAX_BACKUPS
cd "$BACKUP_DIR" || exit
if [ "$(ls -1 | wc -l)" -gt "$MAX_BACKUPS" ]; then
  ls -1t | tail -n +$((MAX_BACKUPS + 1)) | xargs rm -f
fi

echo "Бэкап завершён: $BACKUP_NAME"

gpt version