
$ErrorActionPreference = 'Stop';


$packageName = 'linqpad9.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.linqpad.net/GetFile.aspx?LINQPad9.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = 'c40640fdb14c47c09534c6a99acb61ca32c6c053ac08ad08d2855a2e113e4fbd'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#& "$toolsDir\LINQPad9.exe" -ngen
