#!/bin/bash

#Проверка наличия файлов
if [ ! -f "my_file.txt" ]; then
	echo "ОШибка: файл my_file.txt не найден"
	exit 1
fi

if [ ! -f "messages.txt" ]; then
	echo "ОШибка: файл messages.txt не найден"
	exit 1
fi

#Чтение имён из файла my_file.txt и создание директорий
while IFS= read -r name; do
	#Создание основной директории
	mkdir -p "$name"
	
	#Создание скриптов cherry_pie.sh и good_coffee.sh
	touch "$name/cherry_pie.sh"
	touch "$name/good_coffee.sh"
	
	#Создание поддиректории post_box
	mkdir -p "$name/post_box/"
	
	#Копирование файла messages.txt в директорию post_box
	cp messages.txt "$name/post_box/"
	
	echo "Создана директория: $name"

done < my_file.txt

#Запрос сообщения у пользователя
echo "Ведите ваше сообение одной строкой:"
read user_message

#Добавление сообщения во все файлы messages.txt
while IFS= read -r name; do
	echo "$user_message" >> "$name/post_box/messages.txt"
done < my_file.txt

echo "Сообщение добавлено во все файлы post_box/messages.txt"
