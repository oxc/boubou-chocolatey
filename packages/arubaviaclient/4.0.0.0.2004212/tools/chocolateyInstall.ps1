﻿$ErrorActionPreference = 'Stop';
$packageName= 'Aruba Networks Virtual Intranet Access Client'
$Version = "4.0.3.0.2009111"
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url64bit      = "http://h30326.www3.hpe.com/hpn/Aruba-VIA-4.0.3.0.2009111-64.msi?merchantId=ASP_DROPBOX"
  softwareName  = "Aruba Networks Virtual Intranet Access Client*"
  checksum64    = '58B0B13054D9A35B3FC242B09396A35FC12C659AD38222E19E90F5A636946DC6'
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  }
  
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path -Path $toolsDir -ChildPath "install.ahk"
Write-Verbose "Running AutoHotkey install script $ahkFile"
$ahkProc = Start-Process -FilePath $ahkExe -ArgumentList $ahkFile -PassThru
Write-Debug "$ahkExe Start Time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$($ahkProc.Id)"

Install-ChocolateyPackage @packageArgs