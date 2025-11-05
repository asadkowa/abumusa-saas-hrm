# Quick Setup Guide

## 🚀 Getting Started in 5 Minutes

### Step 1: Install Flutter

If you don't have Flutter installed:

```bash
# macOS/Linux
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Windows
# Download Flutter SDK from https://flutter.dev

# Verify installation
flutter doctor
```

### Step 2: Clone and Setup

```bash
cd mobile_app
flutter pub get
```

### Step 3: Configure API

Edit `lib/core/constants/api_constants.dart`:

```dart
static const String baseUrl = 'YOUR_API_URL_HERE';
```

Example:
```dart
static const String baseUrl = 'https://hrm.yourcompany.com';
```

### Step 4: Generate Code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 5: Run the App

```bash
# Connect your device or start emulator
flutter devices

# Run the app
flutter run
```

## 📱 Testing Credentials

Use these credentials to test the app (if available on your backend):

```
Email: test@example.com
Password: password123
```

## 🔧 IDE Setup

### VS Code

Install these extensions:
- Flutter
- Dart
- Flutter Widget Snippets

### Android Studio

Install Flutter plugin:
1. File → Settings → Plugins
2. Search for "Flutter"
3. Install and restart

## 🐛 Common Setup Issues

### Issue: "Could not resolve all files for configuration"

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Issue: "CocoaPods not installed" (iOS)

**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
```

### Issue: "SDK version conflict"

**Solution:**
Update `pubspec.yaml`:
```yaml
environment:
  sdk: '>=3.0.0 <4.0.0'
```

## 📦 Building for Release

### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### iOS
```bash
flutter build ios --release
# Then open Xcode and archive
```

## 🎯 Next Steps

1. ✅ Configure your API endpoint
2. ✅ Test login functionality
3. ✅ Set up Firebase (optional)
4. ✅ Customize theme colors
5. ✅ Test on physical device
6. ✅ Enable biometric authentication
7. ✅ Configure push notifications

## 📞 Need Help?

- Check the main [README.md](README.md)
- Review API documentation
- Contact: support@yourcompany.com

---

**Happy Coding! 🎉**
