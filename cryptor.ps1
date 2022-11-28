$content = Get-Content 'websocket.ps1'
$base64 = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($content));
$base64 | Out-File encode.txt