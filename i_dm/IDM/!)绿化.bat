@ECHO OFF&(PUSHD "%~DP0")&(REG QUERY "HKU\S-1-5-19">NUL 2>&1)||(
powershell -Command "Start-Process '%~sdpnx0' -Verb RunAs"&&EXIT)

::结束软件相关进程
taskkill /F /IM "IDM*" /T >NUL 2>NUL
taskkill /F /IM "IEMonitor.exe" >NUL 2>NUL
taskkill /F /IM "MediumILStart.exe" >NUL 2>NUL

::获取系统SID并删除残留标识接口
for /f "delims=" %%a in ('wmic userAccount where "Name='%userName%'" get SID /value') do call set "%%a" >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\%SID%\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f /reg:32 >NUL 2>NUL

::删除计算机所有用户残留标识接口
reg delete "HKCU\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{84797876-C678-1780-A556-0CD06786780F}" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKCU\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKLM\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDC95B92-E27C-4745-A8C5-64A52A78855D}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0055C089-8582-441B-A0BF-17B458C2A3A8}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{0F947660-8606-420A-BAC6-51B84DD22A47}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{4764030F-2733-45B9-AE62-3D1F4F6F2861}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{52F6F7BD-DF73-44B3-AE13-89E1E1FB8F6A}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{7D11E719-FF90-479C-B0D7-96EB43EE55D7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{AC746233-E9D3-49CD-862F-068F7B7CCCA4}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{C950922F-897A-4E13-BA38-66C8AF2E0BF7}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{CDD67718-A430-4AB9-A939-83D9074B0038}" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\CLSID\{D0FB58BB-2C07-492F-8BD0-A587E4874B4E}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{79873CC5-3951-43ED-BDF9-D8759474B6FD}" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f /reg:32 >NUL 2>NUL

::清除当前用户假冒注册信息开机启动项
reg delete "HKLM" /f /ve  >NUL 2>NUL
reg delete "HKLM" /f /v "MData"  >NUL 2>NUL
reg delete "HKLM" /f /v "Model"  >NUL 2>NUL
reg delete "HKLM" /f /v "Therad"  >NUL 2>NUL
reg delete "HKCU" /f /ve  >NUL 2>NUL
reg delete "HKCU" /f /v "MData"  >NUL 2>NUL
reg delete "HKCU" /f /v "Model" >NUL 2>NUL
reg delete "HKCU" /f /v "Therad"  >NUL 2>NUL
reg delete "HKLM\Software\DownloadManager" /f >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f >NUL 2>NUL
reg delete "HKLM\Software\DownloadManager" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\Software\Download Manager" /f /reg:32 >NUL 2>NUL
reg delete "HKLM\SOFTWARE\Internet Download Manager" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "MData" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "LName" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "FName" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "Email" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "Serial" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "scansk" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "tvfrdt" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "LstCheck" >NUL 2>NUL
reg delete "HKCU\Software\DownloadManager" /f /v "CheckUpdtVM" >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\DownloadManager" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Download Manager" /f >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\DownloadManager" /f /reg:32 >NUL 2>NUL
reg delete "HKU\.DEFAULT\Software\Download Manager" /f /reg:32 >NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan" >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan" >NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "IDMan" /reg:32 >NUL 2>NUL

::添加软件序列号依赖标记
reg add "HKCU\Software\DownloadManager" /f /v "LName" /d "All Users" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "LName" /d "idm@tonec.com" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "Serial" /d "88888-88888-88888-88888" >NUL 2>NUL
IF NOT EXIST "%ProgramW6432%" (
reg add "HKLM\Software\Internet Download Manager" /f /v "LName" /d "All Users" >NUL 2>NUL
reg add "HKLM\Software\Internet Download Manager" /f /v "Email" /d "idm@tonec.com" >NUL 2>NUL
reg add "HKLM\Software\Internet Download Manager" /f /v "Serial" /d "88888-88888-88888-88888" >NUL 2>NUL
) ELSE (
reg add "HKLM\Software\Internet Download Manager" /f /v "LName" /d "All Users" /reg:32 >NUL 2>NUL
reg add "HKLM\Software\Internet Download Manager" /f /v "Email" /d "idm@tonec.com" /reg:32 >NUL 2>NUL
reg add "HKLM\Software\Internet Download Manager" /f /v "Serial" /d "88888-88888-88888-88888" /reg:32 >NUL 2>NUL
)

::调优选项:启用简体中文,启用额外主题,取消开机启动,取消启动每日提示；
reg add "HKCU\Software\DownloadManager" /f /v "LanguageID" /t REG_DWORD /d "2052" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "ToolbarStyle" /d "Faenza" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "TipStartUp" /t REG_DWORD /d "1" >NUL 2>NUL
reg add "HKCU\Software\DownloadManager" /f /v "LaunchOnStart" /t REG_DWORD /d "0" >NUL 2>NUL

::调用官方参数静默安装
start "" /min /wait "%~dp0idmBroker.exe" -RegServer
start "" /min /wait "%~dp0IDMan.exe" /onsilentsetup /s /q

::删除安装过程残留文件
rd/s/q "%AppData%\IDM"2>NUL
rd /s/q "%Temp%\IDM_Setup_Temp" 2>NUL
del/f/q "%Temp%\*~DF*.TMP" >NUL 2>NUL

::创建桌面快捷方式
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\Internet Download Manager.lnk""):b.TargetPath=""%~sdp0IDMan.exe"":b.WorkingDirectory=""%~sdp0"":b.Save:close")

ECHO.&ECHO 完成 &TIMEOUT /t 2 >NUL&EXIT