echo ****Teste de conectividade****
FOR /L %%C IN (1,1,5) Do ping 0.0.0.0
if %errorlevel% == 0 (
	echo Conexao aceita: %date% %time% >> "test_conect.txt"
) else (
	echo Conexao falhou: %date% %time% >> "test_erro.txt"
)
	if /I %errorlevel% NEQ 0 (
	exit
) else 	(
	goto 1
)

:1
echo O Backup sera realizado agora
md C:\backup
copy C:\windows\*.* C:\backup  >> copias_feitas.txt
"C:\Program Files\WinRAR\WinRAR.exe" a -agBKP-DD:MM:YYYY-HH:MM  H:\BKP\ C:\backup\*.* 
stop
rmdir /S /Q C:\backup
exit
