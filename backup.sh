#!/bin/bash
#
backup_dirs=("/opt" "/home/ec2-user" "/home/AndreevV)

backup_location="/tmp/backup"

mkdir -p $backup_location

for dir in "${backup_dir[@]}";
    do
      backuo_name="$backup_location/$(basename "$dir")_backup_$(date + '%Y%m%d').tar.bz
    echo "$backuo_name"
    tar -cjvf "$backuo_name" "$dir"
  done

find "$backup_location" -type f -name "*tar.bz" -mtime +21 -exec rm -rf {} +
----------------------------------------------------------------------------