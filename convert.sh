#!/bin/bash
TO=UTF-8
# Convert
find ToUTF/ -type f -name "*" | while read fn; do
cp ${fn} ${fn}.bak
FROM=$(file -i index.php | cut -d ';' -f 2 | cut -d '=' -f 2)
ICONV="iconv -f $FROM -t $TO"
$ICONV < ${fn}.bak > ${fn}
rm ${fn}.bak
done