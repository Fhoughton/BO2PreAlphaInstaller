# Download The Game Files
Write-Host '> Before starting download merged2.rar from the leaks and place it in this folder (press any key to continue)'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

# Download Xenia Canary
## Define the url and file names
$xenia_zip_url = "https://github.com/xenia-canary/xenia-canary/releases/download/experimental/xenia_canary.zip"
$xenia_zip_name = "xenia_canary.zip"

## Download and extract Xenia Canary
Write-Host '> Downloading emulator'
Invoke-WebRequest $xenia_zip_url -Out $xenia_zip_name
Write-Host '> Extracting emulator'
Expand-Archive $xenia_zip_name -Force

# Extract the game folder
## Get user to install 7zip
Write-Host '> Install 7zip to continue (press any key to open website, if installed already just carry on)'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
Start "https://www.7-zip.org/" # Open the website

Write-Host '> Extracting merged2.rar via 7zip'
$7zipPath = "$env:ProgramFiles\7-Zip\7z.exe"
if (-not (Test-Path -Path $7zipPath -PathType Leaf)) {
    throw "7zip executable '$7zipPath' not found, did you not install it?"
}

$7zipPath x merged2.rar 

# Finish, press any key and explain map selector
Write-Host 'Installation finished, run select-map.ps1 to set the map and run-alpha.ps1 to start the game'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');