#!/bin/sh
echo "<html><body>" > index.html
echo "<h1>Informacje o serwerze</h1>" >> index.html
echo "<p><b>Adres IP:</b> $(hostname -i)</p>" >> index.html
echo "<p><b>Nazwa serwera (Hostname):</b> $(hostname)</p>" >> index.html
echo "<p><b>Wersja aplikacji:</b> $VERSION</p>" >> index.html
echo "</body></html>" >> index.html