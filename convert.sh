#!/bin/bash
find $1 -type f -print0 | while read -d '' -r f; do
	from=$(file -i "$f" | cut -d ';' -f 2 | cut -d '=' -f 2)
	if [ ! $from == "binary" ]; then
		echo "Convert $from : $f -> UTF8" 
		back="$2$f"
		##echo $back
		backPath="${back%/*}" 
		#echo $back
		mkdir --parents "$backPath"
		mv "$f" "$back"
		iconv -f "$from" -t utf8 "$back" > "$f"
	fi
done
##-exec grep -Il $1 {} \;