import-module au

$releases = 'http://elm-lang.org/install'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "^http.+/Elm-Platform-(\d+\.\d+\.\d+).exe$"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $versionMatch = $url[0] | select-string -Pattern $re
    $version = $versionMatch.Matches[0].Groups[1].Value
    $url = $url[0]

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update
