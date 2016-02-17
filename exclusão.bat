@echo off
forfiles -p "%H:\BKP%" -s -d -7 -m -c" "cmd /c del /f /q @path"
stop
exit
