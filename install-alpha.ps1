# Download The Game Files

# Download Xenia Canary
## Define the url and file names
$xenia_zip_url = "https://github.com/xenia-canary/xenia-canary/releases/download/experimental/xenia_canary.zip"
$xenia_zip_name = "xenia_canary.zip"

## Download and extract Xenia Canary
Invoke-WebRequest $xenia_zip_url -Out $xenia_zip_name
Expand-Archive $xenia_zip_name -Force


# Install Patch

# Finish, press any key and explain map selector
Write-Host 'Installation finished, run select-map.ps1 to load maps'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');