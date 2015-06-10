#!/bin/bash
find -type f -exec grep -Il $1 {} \; | while read f; do
	from=$(file -i "$f" | cut -d ';' -f 2 | cut -d '=' -f 2)
	back="$2$f"
	##echo $back
	backPath="${back%/*}" 
	echo $back
	mkdir --parents "$backPath"
	cp "$f" "$2$f"
	iconv -f $from -t UTF8 $back > "$f"
done
