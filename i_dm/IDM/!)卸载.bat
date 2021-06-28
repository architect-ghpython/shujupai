@ECHO OFF&(PUSHD "%~DP0")&(REG QUERY "HKU\S-1-5-19">NUL 2>&1)||(
powershell -Command "Start-Process '%~sdpnx0' -Verb RunAs"&&EXIT)

taskkill /F /IM "IDM*" /T >NUL 2>NUL
taskkill /F /IM "IEMonitor.exe" >NUL 2>NUL
taskkill /F /IM "MediumILStart.exe" >NUL 2>NUL

::卸载组件
if exist idmBroker.exe start "" /wait "%~dp0idmBroker.exe" -RegServer
if exist Uninstall.exe start "" /min /wait "%~dp0Uninstall.exe" -uninstdriv
if exist IDMIECC.dll regsvr32 /s /u IDMIECC.dll
if exist IDMIECC64.dll regsvr32 /s /u IDMIECC64.dll
if exist IDMGetAll.dll regsvr32 /s /u IDMGetAll.dll
if exist IDMGetAll64.dll regsvr32 /s /u IDMGetAll64.dll
if exist IDMShellExt.dll regsvr32 /s /u IDMShellExt.dll
if exist IDMShellExt64.dll regsvr32 /s /u IDMShellExt64.dll
if exist downlWithIDM.dll regsvr32 /s /u downlWithIDM.dll
if exist downlWithIDM64.dll regsvr32 /s /u downlWithIDM64.dll

::清除安装及卸载残留数据
rd/s/q "%AppData%\IDM" 2>NUL
rd/s/q "%AppData%\DMCache" 2>NUL
rd /s/q "%Temp%\IDM_Setup_Temp" 2>NUL
del/f/q "%Temp%\*~DF*.TMP" >NUL 2>NUL

::清除快捷方式和临时数据
ver|findstr "\<6\.[0-9]\.[0-9][0-9]*\> \<10\.[0-9]\.[0-9][0-9]*\>" >NUL && (
rd/s/q "%ProgramData%\IDM" 2>NUL
del /q "%Public%\Desktop\Internet Download Manager.lnk" >NUL 2>NUL
del /q "%UserProfile%\Desktop\Internet Download Manager.lnk" >NUL 2>NUL
rd/s/q "%AppData%\Microsoft\Windows\Start Menu\Programs\Internet Download Manager"2>NUL
rd/s/q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Internet Download Manager"2>NUL )
ver|findstr "5\.[0-9]\.[0-9][0-9]*" >NUL && (
rd/s/q "%AllUsersProfile%\Application Data\IDM" 2>NUL
del /q "%UserProfile%\桌面\Internet Download Manager.lnk" >NUL 2>NUL
del /q "%AllUsersProfile%\桌面\Internet Download Manager.lnk" >NUL 2>NUL
rd/s/q "%UserProfile%\「开始」菜单\程序\Internet Download Manager"2>NUL
rd/s/q "%AllUsersProfile%\「开始」菜单\程序\Internet Download Manager"2>NUL )

::清除系统卸载程序列表项
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Internet Download Manager" /f /reg:32 >NUL 2>NUL

::清除所有相关注册表键值
reg delete "HKLM\Software\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f >NUL 2>NUL
reg delete "HKLM\Software\DownloadManager" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f /reg:32 >NUL 2>NUL 
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f  /v "IDMan" >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan" /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\IDMan.CIDMLinkTransmitter" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Idmfsa.IDMEFSAgent" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Idmfsa.IDMEFSAgent.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\idmBroker.EXE" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\idmBroker.OptionsReader" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\idmBroker.OptionsReader.1" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\{3C085E26-7DF6-4A34-ADA6-877D06BAE9A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\AppID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{5518B636-6884-48CA-A9A7-1CFD3F3BA916}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{ECF21EAB-3AA8-4355-82BE-F777990001DD}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{13D4E387-BAB7-47E7-B3D7-3F01ABC463EA}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{2223E76A-0894-4502-841F-0CF7517A713B}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{28670AE0-CAF4-4836-8418-0F456023EBF7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{4BD46AAE-C51F-4BF7-8BC0-2E86E33D1873}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6B9EB066-DA1F-4C0A-AC62-01AC892EF175}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{6EDC7F8E-EB3D-4F9A-B693-216F07C94D74}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{94D09862-1875-4FC9-B434-91CF25C840A1}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{A87AB5DD-211B-4284-8CBD-B92F77A5DE14}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\Interface\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f /reg:32 >NUL 2>NUL


reg delete "HKLM\SOFTWARE\Google\Chrome\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Google\Chrome\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Google\Chrome\NativeMessagingHosts\com.tonec.idm" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Google\Chrome\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\DF3C24F9BFD666761B268073FE06D1CC8D4F82A4" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer" /f /v "DownloadUI" >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Low Rights\DragDrop\{F6E1B27E-F2DA-4919-9DBD-CAB90A1D662B}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer" /f /v "DownloadUI" /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Low Rights\DragDrop\{F6E1B27E-F2DA-4919-9DBD-CAB90A1D662B}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Tracing\IDMan_RASAPI32" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Microsoft\Tracing\IDMan_RASAPI32" /f /reg:32 >NUL 2>NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy\PolicyApplicationState" /f /v "PolicyState" /t REG_DWORD /d "2">NUL 2>NUL

reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan">NUL 2>NUL
reg delete "HKCU\SOFTWARE\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /reg:32 /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Classes\CLSID\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\CocCoc\Browser\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\CocCoc\Browser\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Edge\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Edge\Extensions\llbjbkhnmlidjebalopleeepgdfgcpec" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer" /f /v "DownloadUI" >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer" /f /v "DownloadUI" /reg:32 >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载全部链接" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Mozilla\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Mozilla\SeaMonkey\Extensions" /f /v "mozilla_cc@internetdownloadmanager.com" >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Mozilla\SeaMonkey\Extensions" /f /v "mozilla_cc2@internetdownloadmanager.com" >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\Low Rights\DragDrop\{19129CDA-AFC0-4330-99BC-C5A834F89006}" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{15B851AF-A4B9-43EF-97D3-28E1B4A5DB9B}" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{1902485B-CE75-42C1-BA2D-57E660793D9A}" /f >NUL 2>NUL
reg delete "HKCU\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f /reg:32 >NUL 2>NUL
for /f "delims=" %%a in ('wmic userAccount where "Name='%userName%'" get SID /value') do call set "%%a" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan">NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer" /f /v "DownloadUI" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer" /f /v "DownloadUI" /reg:32 >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\MenuExt\使用 IDM 下载全部链接" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\CocCoc\Browser\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\CocCoc\Browser\Extensions\ngpampappnmepgilojfohadhhmbhlaek" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Edge\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Edge\Extensions\llbjbkhnmlidjebalopleeepgdfgcpec" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Mozilla\NativeMessagingHosts\com.tonec.idm" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Mozilla\SeaMonkey\Extensions" /f /v "mozilla_cc@internetdownloadmanager.com" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Mozilla\SeaMonkey\Extensions" /f /v "mozilla_cc2@internetdownloadmanager.com" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\Low Rights\DragDrop\{19129CDA-AFC0-4330-99BC-C5A834F89006}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{15B851AF-A4B9-43EF-97D3-28E1B4A5DB9B}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{1902485B-CE75-42C1-BA2D-57E660793D9A}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{E0DACC63-037F-46EE-AC02-E4C7B0FBFEB4}" /f >NUL 2>NUL

::备份选项配置
reg delete "HKCU\Software\DownloadManager" /f /v "MData" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "Email" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "LName" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "FName" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "Serial" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "tvfrdt" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "scansk" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "idmvers" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "ExePath" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "TempPath" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "LstCheck" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "CheckUpdtVM" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "AppDataIDMFolder" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "CommonAppDataIDMFolder" >NUL 2>NUL
regedit /e "!)选项配置.reg" HKEY_CURRENT_USER\Software\DownloadManager >NUL 2>NUL
    
CLS&ECHO.&ECHO 清理完成，确认删除？
ECHO.&ECHO 1、删除软件备份保存选项配置
ECHO.&ECHO 2、删除软件以及清除选项配置
CHOICE /C 12 /N >NUL 2>NUL

IF "%ERRORLEVEL%"=="2" (
  DEL /F/Q IDMShellExt*.dll >NUL 2>NUL & DEL /F/Q IDMIECC*.dll >NUL 2>NUL
  IF EXIST IDMShellExt.dll ren IDMShellExt.dll "IDMShellExt.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMShellExt64.dll ren IDMShellExt64.dll "IDMShellExt64.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMIECC.dll ren IDMIECC.dll "IDMIECC.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMIECC64.dll ren IDMIECC64.dll "IDMIECC64.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  reg delete "HKCU\Software\DownloadManager" /f >NUL 2>NUL
  reg delete "HKU\%SID%\Software\DownloadManager" /f >NUL 2>NUL
  PUSHD .. & RD /S/Q "%~DP0" 2>NUL
)
  
IF "%ERRORLEVEL%"=="1" (
  IF EXIST IDMShellExt.dll ren IDMShellExt.dll "IDMShellExt.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMShellExt64.dll ren IDMShellExt64.dll "IDMShellExt64.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMIECC.dll ren IDMIECC.dll "IDMIECC.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  IF EXIST IDMIECC64.dll ren IDMIECC64.dll "IDMIECC64.dll.%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.tmp" >NUL 2>NUL
  FOR /F "delims=*" %%a IN ('dir /a/b *.*^|findstr /v /i "选项配置"') DO ( RD /S/Q "%%a" 2>NUL & DEL /F/Q "%%a" >NUL 2>NUL )
)