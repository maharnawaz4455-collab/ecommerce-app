@echo off
echo ========================================
echo Direct iOS .ipa Build Script
echo ========================================
echo.

echo This script will help you create .ipa file
echo using cloud build services without GitHub Actions
echo.

echo Step 1: Checking Flutter installation...
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo Flutter not found. Installing Flutter...
    echo Downloading Flutter SDK...
    powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.5-stable.zip' -OutFile 'flutter.zip'}"
    
    if exist "flutter.zip" (
        echo Extracting Flutter...
        powershell -Command "Expand-Archive -Path 'flutter.zip' -DestinationPath 'C:\' -Force"
        del flutter.zip
        set PATH=%PATH%;C:\flutter\bin
        echo Flutter installed successfully!
    ) else (
        echo Failed to download Flutter
        pause
        exit /b 1
    )
) else (
    echo Flutter found!
)

echo.
echo Step 2: Getting dependencies...
flutter pub get

echo.
echo Step 3: Building for iOS...
echo Note: iOS builds require macOS and Xcode
echo This will prepare the project for cloud build
echo.

flutter build ios --release --no-codesign

echo.
echo ========================================
echo Build Preparation Complete!
echo ========================================
echo.
echo Next Steps for .ipa file:
echo 1. Go to https://codemagic.io
echo 2. Sign up with GitHub account
echo 3. Connect repository: maharnawaz4455-collab/ecommerce-app
echo 4. Start build to get .ipa file
echo.
echo OR
echo.
echo 1. Go to https://bitrise.io
echo 2. Sign up and connect GitHub
echo 3. Select your repository
echo 4. Build and download .ipa
echo.

pause
