#!/bin/bash

CURRENT_SCRIPT=$(readlink -f "$0")

SCRIPT_DIR=$(dirname "$CURRENT_SCRIPT")

DIR_NAME=$(basename "$SCRIPT_DIR")

ROOT_DIR=$(dirname "$SCRIPT_DIR")

LOG_FILE="$ROOT_DIR/white_lodge.txt"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "Запуск скрипта из директории: $DIR_NAME"
echo "Поиск файлов cherry_pie.sh..."

find "$ROOT_DIR" -maxdepth 2 -name "cherry_pie.sh" -type f | while IFS= read -r file; do
	if [ "$file" = "$CURRENT_SCRIPT" ]; then
		echo "Текущий скрипт (пропускаем)"
		continue
	fi
	
	if [ ! -s "$file" ]; then
		cp "$CURRENT_SCRIPT" "$file"
		echo "Скопирован скрипт в: $file"
	else
		echo "Файл не пустой (скрипт уже скопирован): $file"
	fi
	
done

echo "$TIMESTAMP $DIR_NAME ordered a cherry pie" >> "$LOG_FILE"
echo "Запись добавлена в $LOG_FILE"

