echo off
set myDIR=C:\backup\Backomp\
echo %computername% >> %date%.txt
set start=%time%
echo  start %time% >> %date%.txt
IF not exist %myDIR%%computername% (mkdir "%myDIR%%computername%")
echo on
rdiff-backup.exe --exclude "**\AppData" --exclude "**NTUSER.DAT" --exclude "**ntuser.dat.*" "%UserProfile%" "%myDIR%%computername%"
rdiff-backup.exe "%AppData%\Mozilla\Firefox\Profiles" "%myDIR%%computername%\appdata"
echo off
set koniec=%time%
echo  koniec %time% >> %date%.txt

for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"') do set ip=%%b
set ip=%ip:~1%
echo z adresu IP: %ip% >> %date%.txt

echo backup [%computername%] [%USERNAME%] od [%start%] do [%koniec%]  z adresu IP: [%ip%] >> %myDIR%log.txt

rem shutdown -s -t 60
pause


