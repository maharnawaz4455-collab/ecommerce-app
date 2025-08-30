# Flutter iOS .ipa Build Script for Windows
# This script helps prepare your Flutter project for iOS build

Write-Host "========================================" -ForegroundColor Green
Write-Host "Flutter iOS .ipa Build Script" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Flutter is installed
try {
    $flutterVersion = flutter --version
    Write-Host "Flutter found!" -ForegroundColor Green
    Write-Host $flutterVersion -ForegroundColor Yellow
} catch {
    Write-Host "ERROR: Flutter is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Flutter from: https://flutter.dev/docs/get-started/install/windows" -ForegroundColor Yellow
    Write-Host "After installation, add Flutter to your system PATH" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Step 1: Getting Dependencies" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
flutter pub get

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Step 2: Cleaning Previous Builds" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
flutter clean
flutter pub get

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Step 3: Analyzing Project" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
flutter analyze

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Step 4: Testing Build" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Note: iOS builds require a Mac with Xcode" -ForegroundColor Yellow
Write-Host ""

# Try to build for iOS (this will fail on Windows, but shows the process)
Write-Host "Attempting to build for iOS..." -ForegroundColor Cyan
try {
    flutter build ios --release
} catch {
    Write-Host "Expected error: iOS builds require macOS and Xcode" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Next Steps for .ipa Creation:" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "1. Transfer this project to a Mac computer" -ForegroundColor Cyan
Write-Host "2. Install Xcode from Mac App Store" -ForegroundColor Cyan
Write-Host "3. Install CocoaPods: sudo gem install cocoapods" -ForegroundColor Cyan
Write-Host "4. Run: flutter build ios --release" -ForegroundColor Cyan
Write-Host "5. Open ios/Runner.xcworkspace in Xcode" -ForegroundColor Cyan
Write-Host "6. Configure signing and capabilities" -ForegroundColor Cyan
Write-Host "7. Archive and export .ipa file" -ForegroundColor Cyan
Write-Host ""
Write-Host "For detailed instructions, see: IPA_BUILD_GUIDE.md" -ForegroundColor Yellow
Write-Host ""

# Create a summary file
$summary = @"
Flutter iOS Build Summary
=========================

Project: E-Commerce App
Version: 1.0.0+1
Bundle ID: com.example.day16_shopping

Files Created:
- IPA_BUILD_GUIDE.md (Complete build guide)
- build_ipa.bat (Windows batch script)
- build_ipa.ps1 (PowerShell script)
- ios/exportOptions.plist (Export configuration)
- ios/fastlane/Fastfile (Automated build configuration)

Next Steps:
1. Transfer to Mac
2. Install Xcode
3. Configure signing
4. Build and export .ipa

For help: See IPA_BUILD_GUIDE.md
"@

$summary | Out-File -FilePath "build_summary.txt" -Encoding UTF8
Write-Host "Build summary saved to: build_summary.txt" -ForegroundColor Green

Read-Host "Press Enter to exit"
