# Disable proxy settings in Internet Properties

$proxyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

# Set ProxyEnable to 0 (disable proxy)
Set-ItemProperty -Path $proxyPath -Name ProxyEnable -Value 0

# Optionally, clear the proxy server field (not required but recommended)
Set-ItemProperty -Path $proxyPath -Name ProxyServer -Value ""

# Notify that settings have been changed
Write-Host "Proxy settings have been disabled."

# Restarting Internet Explorer/Edge for the settings to take effect
Stop-Process -Name "iexplore" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue
