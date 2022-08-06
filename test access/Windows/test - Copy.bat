set /p MYIP="SRC IP Address: "
for /F %%A in (servers.txt) do powershell Test-NetConnection -ComputerName %%A -InformationLevel "Detailed" -Port %%B >> %MYIP%
pause