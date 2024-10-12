@echo off
chcp 65001 >nul
:: 65001 - UTF-8

:: Path check
set scriptPath=%~dp0
set "scriptPathNoSpaces=%scriptPath: =%"

if not "%scriptPath%"=="%scriptPathNoSpaces%" (
    echo ОБНАРУЖЕНА ПРОБЛЕМА!
	echo Путь содержит пробелы. Пожалуйста, переместите скрипт в директорию без пробелов.
    echo ===
    echo Варианты решения:
	echo - Уберите папку с фиксом с рабочего стола
	echo - Убедитесь, что папка с фиксом называется DiscordFix
	echo - Не нашли решение? Пишите нам в чат - https://t.me/official_xochat
	
	pause
	exit /b
)

set BIN=%~dp0bin\

set LIST_TITLE=ZAPRET: Ultimate Fix ALT
set LIST_PATH=%~dp0lists\list-ultimate.txt

start "%LIST_TITLE%" /min "%BIN%winws.exe" ^
--wf-tcp=80,443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist="%LIST_PATH%" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80 --hostlist="%LIST_PATH%" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-tcp=443 --hostlist="%LIST_PATH%" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"