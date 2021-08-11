#!/bin/bash

free -h > ~/backups/freemem/free_mem.txt

du -h > ~/backups/diskuse/disk_usage.txt

lsof -e /run/user/1000/gvfs > ~/backups/openlist/open_list.txt

df -h > ~/backups/freedisk/free_disk.txt
