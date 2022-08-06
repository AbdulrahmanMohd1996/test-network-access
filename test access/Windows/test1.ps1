$ip=Get-content "G:\SW\test access\Windows\servers.txt"
$port=Get-content "G:\SW\test access\Windows\ports.txt"

$Server = Read-Host -Prompt 'Input your server  name'

foreach ($ip1 in $ip){
	
	$CharArray =$ip1.Split(" ")

	$op=Test-NetConnection -computerName $CharArray[0] -Port $CharArray[1]
}