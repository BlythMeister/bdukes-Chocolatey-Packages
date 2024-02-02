﻿$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/Wilfred/difftastic/releases/download/0.55.0/difft-x86_64-pc-windows-msvc.zip'
  checksum      = '5821679ef39551498fdec7fd3f23074aa70f477eab1f0b531fd0276bd68fe538'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs;
