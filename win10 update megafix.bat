## MEGAFIX for WINDOWS 10 UPDATES
# this script fixed 90% of my windows update problems
# if you want to fix 100% of windows problems, install a linux distro
##

sfc /scannow
dism.exe /online /cleanup-image /scanhealth
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
Del %APPDAATA%\Microsoft\Network\Downloader\*.*&
rmdir %systemroot%\SoftwareDistribution /S /Q
rmdir %systemroot%\system32\catroot2 /S /Q
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
netsh winsock reset
netsh winsock reset proxy
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
