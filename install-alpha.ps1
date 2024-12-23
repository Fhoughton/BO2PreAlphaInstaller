# Tell the user to read the docs 
Write-Host '> Read README.md for pre-install instructions before starting! (press any key to continue)'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

# Download Xenia Canary
$xenia_zip_url = "https://github.com/xenia-canary/xenia-canary/releases/download/experimental/xenia_canary.zip"
$xenia_zip_name = "xenia_canary.zip"
Write-Host '> Downloading emulator'
Invoke-WebRequest $xenia_zip_url -Out $xenia_zip_name
Write-Host '> Extracting emulator'
Expand-Archive $xenia_zip_name -Force

# Extract the game folder
Write-Host '> Extracting merged2.rar via 7zip'
$7zipPath = "$env:ProgramFiles\7-Zip\7z.exe"
if (-not (Test-Path -Path $7zipPath -PathType Leaf)) {
    throw "7zip executable '$7zipPath' not found, did you not install it?"
}
Set-Alias Start-SevenZip $7zipPath
Start-SevenZip x merged2.rar 

# Finish, press any key and explain map selector
Write-Host 'Installation finished, run select-map.ps1 to set the map and run-alpha.ps1 to start the game'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');