$appName = "qr_code_utility"
$defaultBuildName = "1.0.0"
$defaultBuildNumber = "1"
$timestamp = Get-Date -Format "yyyyMMdd"

$buildName = Read-Host "Build name [default: $defaultBuildName]"
if ([string]::IsNullOrWhiteSpace($buildName)) { $buildName = $defaultBuildName }

$buildNumber = Read-Host "Build number [default: $defaultBuildNumber]"
if ([string]::IsNullOrWhiteSpace($buildNumber)) { $buildNumber = $defaultBuildNumber }

Write-Host "`nChoose target platform:"
Write-Host "1) android-arm"
Write-Host "2) android-arm64"
Write-Host "3) android-x64"
Write-Host "4) All platforms"

$selectedPlatforms = @()
while ($selectedPlatforms.Count -eq 0) {
  $selection = Read-Host "Option [1-4]"
    
  switch ($selection) {
    1 { $selectedPlatforms = @("android-arm") }
    2 { $selectedPlatforms = @("android-arm64") }
    3 { $selectedPlatforms = @("android-x64") }
    4 { $selectedPlatforms = @("android-arm", "android-arm64", "android-x64") }
    default { Write-Host "Invalid option" -ForegroundColor Red }
  }
}

$dartDefines = ""
if ((Read-Host "`nAdd environment variables? [y/N]") -eq "y") {
  $apiKey = Read-Host "API_KEY (skip with Enter)"
  $envMode = Read-Host "ENV value (e.g: prod)"
    
  if (-not [string]::IsNullOrEmpty($apiKey)) { $dartDefines += "--dart-define API_KEY=$apiKey " }
  $dartDefines += "--dart-define ENV=$envMode"
}

foreach ($platform in $selectedPlatforms) {
  $abi = switch ($platform) {
    "android-arm" { "armeabi-v7a" }
    "android-arm64" { "arm64-v8a" }
    "android-x64" { "x86_64" }
  }

  Write-Host "`nBuilding for $platform..." -ForegroundColor Cyan
  flutter build apk --release `
    --build-name=$buildName `
    --build-number=$buildNumber `
    --target-platform=$platform `
    --split-debug-info=./release/debug_info `
    --obfuscate `
    --code-size-directory=./release/code_size `
    $dartDefines

  if (-not $?) {
    Write-Host "Build failed for $platform!" -ForegroundColor Red
    exit 1
  }

  $sourcePath = "./build/app/outputs/apk/release/app-release.apk"
  $targetDir = "./release/android/$abi"
  $targetPath = "$targetDir/${appName}_${buildName}_${buildNumber}_${timestamp}_${abi}.apk"

  New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
  Copy-Item -Path $sourcePath -Destination $targetPath -Force

  Write-Host "APK created: $targetPath" -ForegroundColor Green
  Write-Host "File size: $([math]::Round((Get-Item $targetPath).Length/1MB, 2)) MB`n"
}