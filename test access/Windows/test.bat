set /p MYIP="SRC IP Address: "

for /f "tokens=1,2" %%A in (servers.txt) do powershell Test-NetConnection -ComputerName %%A -InformationLevel "Detailed" -Port %%B >> %MYIP%
pause