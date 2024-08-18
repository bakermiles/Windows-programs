@echo off
C:/
:A
CLS
netsh wlan show profile

@echo
Set /p ENC="ssid: "

:output
netsh wlan show profile %ENC% key=clear
pause