param(
    [Parameter(Mandatory=$false)][string]$CustomDomain = ""
)

function Write-Log {
    param(
        [Parameter(Mandatory=$false)][string]$type = "log",
        [Parameter(Mandatory=$true)][string]$msg
    )

    $tagConfig = @{color = ""; tag = ""}

    switch ($type)
    {
        'error' {$tagConfig = @{color = 'Red'; tag = 'ERROR'}}
        'warning' {$tagConfig = @{color = 'Yellow'; tag = 'WARNING'}}
        'info' {$tagConfig = @{color = 'Cyan'; tag = 'INFO'}}
        'log' {$tagConfig = @{color = 'Green'; tag = 'LOG'}}
    }

    Write-Host " [$($tagConfig.tag)]" -ForeGroundColor $tagConfig.color -NoNewLine
    Write-Host "  $($msg)"
}

# abort on errors
$ErrorActionPreference = "Stop"

# build
Write-Log -msg "Building Application..."
npm run build
Write-Log -type 'info' -msg "Application built!"

# goto build Directory
cd '.\dist'

# Set Custom Domain CNAME Record, if used
$CustomDomain = $CustomDomain.ToLower()
if($($CustomDomain.Length -gt 0) -and $($CustomDomain -match '^([a-z0-9]+\.)*[a-z0-9]+\.[a-z0-9]{2,}$')){
    Write-Log -type 'info' -msg "Found valid custom domain: $($CustomDomain)"

    if(!$(Test-Path -Path '.\CNAME')){
        Write-Log -msg 'Creating "./CNAME" file...'
        New-Item -Path '.\CNAME' -ItemType 'File' -Content $CustomDomain
        Write-Log -msg 'File "./CNAME" created.' -type 'info'
    }

    Set-Content -Path '.\CNAME' -Content $CustomDomain
    Write-Log -msg 'Custom domain configured.' -type 'info'
}
else {
    Write-Log -type 'info' -msg 'No valid custom Domain found. Proceeding without...'
}

Write-Log -msg 'Initializing Git...'
git init
Write-Log -msg 'Adding all App Contents to Git...'
git add -A
Write-Log -msg 'Committing contents (message: "deploy")...'
git commit -m 'deploy'
Write-Log -msg 'Push to Repository...'
git push -f git@github.com:slowlorizz/fruchtis.git master:web

Write-Log -msg 'New App-Version deployed!' -type 'info'

cd "..\"
