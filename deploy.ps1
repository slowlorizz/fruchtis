param(
    [Parameter(Mandatory=$false)][string]$CustomDomain = ""
)

# abort on errors
$ErrorActionPreference = “Stop"

# build
npm run build

# goto build Directory
cd '.\dist'

# Set Custom Domain CNAME Record, if used
$CustomDomain = $CustomDomain.ToLower()
if($($CustomDomain.Length -gt 0) -and $($CustomDomain -match '^([a-z0-9]+\.)*[a-z0-9]+\.[a-z0-9]{2,}$')){
    if(!$(Test-Path -Path '.\CNAME')){
        New-Item -Path '.\CNAME' -ItemType 'File' -Content $CustomDomain
    }

    Set-Content -Path '.\CNAME' -Content $CustomDomain
}

git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:slowlorizz/fruchtis.git master:gh-pages

cd -
