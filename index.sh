#!/bin/sh
OUT_FILE="/usr/share/nginx/html/index.html"

echo "<html><body>" > $OUT_FILE
echo "<h1>Informacje o serwerze</h1>" >> $OUT_FILE
echo "<p><b>Adres IP:</b> $(hostname -i)</p>" >> $OUT_FILE
echo "<p><b>Nazwa serwera (Hostname):</b> $(hostname)</p>" >> $OUT_FILE
echo "<p><b>Wersja aplikacji:</b> $VERSION</p>" >> $OUT_FILE
echo "</body></html>" >> $OUT_FILE