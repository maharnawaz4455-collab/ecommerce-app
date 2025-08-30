@echo off
echo ========================================
echo Flutter iOS .ipa Build Script
echo ========================================
echo.

echo Checking Flutter installation...
where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Flutter is not installed or not in PATH
    echo Please install Flutter from: https://flutter.dev/docs/get-started/install/windows
    echo After installation, add Flutter to your system PATH
    pause
    exit /b 1
)

echo Flutter found! Checking Flutter doctor...
flutter doctor

echo.
echo ========================================
echo Step 1: Getting Dependencies
echo ========================================
flutter pub get

echo.
echo ========================================
echo Step 2: Cleaning Previous Builds
echo ========================================
flutter clean
flutter pub get

echo.
echo ========================================
echo Step 3: Building for iOS
echo ========================================
echo Note: This step requires a Mac with Xcode installed
echo If you're on Windows, you'll need to:
echo 1. Transfer this project to a Mac
echo 2. Install Xcode from Mac App Store
echo 3. Run: flutter build ios --release
echo 4. Open ios/Runner.xcworkspace in Xcode
echo 5. Archive and export .ipa file
echo.

echo Attempting to build for iOS...
flutter build ios --release

echo.
echo ========================================
echo Build Process Complete!
echo ========================================
echo.
echo Next Steps:
echo 1. Transfer project to Mac if on Windows
echo 2. Open ios/Runner.xcworkspace in Xcode
echo 3. Configure signing and capabilities
echo 4. Archive and export .ipa file
echo.
echo For detailed instructions, see: IPA_BUILD_GUIDE.md
echo.
pause
