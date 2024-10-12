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

set LIST_TITLE=ZAPRET: Discord Fix Beeline-Rostelekom
set LIST_PATH=%~dp0lists\list-discord.txt

start "%LIST_TITLE%" /min "%BIN%winws.exe" --wf-udp=50000-65535 ^
--filter-udp=50000-65535 --hostlist="%LIST_PATH%" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,split2
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,split2 --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,disorder2
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,disorder2 --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata --wssize 1:6
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin --wssize 1:6
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,split2 --wssize 1:6
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,split2 --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin --wssize 1:6
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,disorder2 --wssize 1:6
--wf-l3=ipv4 --wf-tcp=443 --dpi-desync=syndata,disorder2 --dpi-desync-fake-syndata=/cygdrive/c/zapret-win-bundle-master/blockcheck/zapret/files/fake/tls_clienthello_iana_org.bin --wssize 1:6