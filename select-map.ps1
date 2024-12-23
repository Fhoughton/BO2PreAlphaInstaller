# Map Selection 
Write-Host 'Choose a map:'
Write-Host '1.) Origins'
Write-Host '2.) Ascension'
Write-Host '3.) Moon'
Write-Host '4.) Five'
Write-Host '5.) Shangri-La'
Write-Host '6.) Kino Der Toten'
Write-Host '7.) Verrukt'
Write-Host '8.) Der Riese'
Write-Host '9.) Shi No Numa'
Write-Host '10.) Nacht'
$Which = Read-Host 'Enter a number'
switch ($Which) {
  1 {$mapname = "zm_tomb"}
  2 {$mapname = "zm_cosmodrome"}
  3 {$mapname = "zm_moon"}
  4 {$mapname = "zm_pentagon"}
  5 {$mapname = "zm_temple"}
  6 {$mapname = "zm_theater"}
  7 {$mapname = "zm_asylum"}
  8 {$mapname = "zm_factory"}
  9 {$mapname = "zm_sumpf"}
  10 {$mapname = "zm_prototype"}
  11 {$mapname = "zm_buried"}
  default {
    Write-Host 'Unknown option, press any key to exit.'
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    Exit
    }
}
Write-Host $mapname

# Modify the config to set the new map 
$filePath = "xenia_canary/xenia-canary.config.toml"
$regexPattern = "cl = .*"
$replacement = "cl = `"devmap $($mapname)`""

## Read the file content
$content = Get-Content -Path $filePath

## Replace matching lines
$newContent = $content | ForEach-Object {
    if ($_ -match $regexPattern) {
        $replacement
    } else {
        $_
    }
}

## Write the updated content back to the file
$newContent | Set-Content -Path $filePath

Write-Host "Lines matching the regex pattern have been replaced."

# Finished
Write-Host 'Map set, press any key to exit.'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');