# Assumes admin Powershell

taskkill /f /im wslservice.exe
taskkill /f /im wslhost.exe
taskkill /f /im wsl.exe
wsl --shutdown
Get-Service LxssManager | Restart-Service
