# iOS .ipa File Build Guide

## Prerequisites

### 1. Install Flutter SDK
Download and install Flutter from: https://flutter.dev/docs/get-started/install/windows

### 2. Install Xcode (Mac Required)
- Download Xcode from Mac App Store
- Install iOS Simulator
- Accept Xcode license: `sudo xcodebuild -license accept`

### 3. Install CocoaPods
```bash
sudo gem install cocoapods
```

## Steps to Build .ipa File

### Step 1: Setup Flutter Environment
```bash
# Add Flutter to PATH (Windows)
# Add C:\flutter\bin to your system PATH

# Verify installation
flutter doctor
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Clean and Build
```bash
# Clean previous builds
flutter clean

# Get dependencies again
flutter pub get

# Build for iOS
flutter build ios --release
```

### Step 4: Open in Xcode
```bash
# Open iOS project in Xcode
open ios/Runner.xcworkspace
```

### Step 5: Configure Signing & Capabilities
1. In Xcode, select "Runner" project
2. Select "Runner" target
3. Go to "Signing & Capabilities" tab
4. Select your Team (Apple Developer Account required)
5. Set Bundle Identifier (e.g., com.yourcompany.ecommerce)

### Step 6: Build Archive
1. In Xcode, select "Product" → "Archive"
2. Wait for build to complete
3. In Organizer window, click "Distribute App"
4. Choose distribution method:
   - App Store Connect (for App Store)
   - Ad Hoc (for testing)
   - Enterprise (for enterprise distribution)

### Step 7: Export .ipa
1. Choose "Ad Hoc" or "Enterprise" for direct .ipa file
2. Select your provisioning profile
3. Choose save location
4. Click "Export"

## Alternative: Command Line Build (Advanced)

### Using fastlane (Recommended)
```bash
# Install fastlane
gem install fastlane

# Initialize fastlane
cd ios
fastlane init

# Build and export .ipa
fastlane build_ipa
```

### Using xcodebuild
```bash
# Build archive
xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release -archivePath build/Runner.xcarchive archive

# Export .ipa
xcodebuild -exportArchive -archivePath build/Runner.xcarchive -exportPath build/ios -exportOptionsPlist exportOptions.plist
```

## Important Notes

### Bundle Identifier
Update `ios/Runner/Info.plist`:
```xml
<key>CFBundleIdentifier</key>
<string>com.yourcompany.ecommerce</string>
```

### Version Number
Update `pubspec.yaml`:
```yaml
version: 1.0.0+1  # Format: version+build_number
```

### Required Permissions
Add to `ios/Runner/Info.plist` if needed:
```xml
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to scan QR codes</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app needs photo library access to select images</string>
```

## Troubleshooting

### Common Issues:
1. **Signing Issues**: Ensure valid Apple Developer account and provisioning profile
2. **Build Errors**: Run `flutter clean` and `flutter pub get`
3. **Dependency Issues**: Check `pubspec.yaml` for compatibility
4. **Xcode Issues**: Update Xcode to latest version

### Verification Commands:
```bash
flutter doctor -v
flutter build ios --verbose
```

## Distribution Options

1. **App Store**: Upload to App Store Connect
2. **TestFlight**: For beta testing
3. **Ad Hoc**: For specific device testing
4. **Enterprise**: For internal company distribution

## File Locations
- **Archive**: `~/Library/Developer/Xcode/Archives/`
- **.ipa File**: Exported to chosen location
- **Build Files**: `build/ios/` directory
