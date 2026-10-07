# HRM Mobile App - Flutter

A comprehensive **Flutter mobile application** for the SaaS HRM (Human Resource Management) system. This app provides employees with essential HR features including attendance tracking, leave management, expense claims, and profile management.

## 📱 Features

### ✅ Core Features Implemented

1. **Authentication**
   - Email/Password login
   - Token-based authentication (Laravel Sanctum)
   - Biometric login support
   - Password reset
   - Logout (single device & all devices)

2. **Dashboard**
   - Welcome card with user information
   - Quick action buttons
   - Today's summary (check-in/out, working hours)
   - Navigation to all modules

3. **Attendance Management**
   - Check-in with GPS location tracking
   - Check-out functionality
   - Break management (start/end breaks)
   - Late arrival reason submission
   - Attendance history
   - Monthly statistics (present, absent, late)
   - QR code scanning support

4. **Leave Management**
   - View leave balance
   - Request new leave
   - Leave history with status
   - Leave type management
   - Leave approval workflow

5. **Expense Management**
   - Submit expense claims
   - Attach receipts/documents
   - Track expense status
   - View claim history
   - Multiple expense categories

6. **Profile Management**
   - View profile information
   - Edit profile details
   - Change password
   - Upload profile picture
   - App settings (notifications, dark mode, biometric)

## 🏗️ Architecture

This app follows **Clean Architecture** principles with a feature-based structure:

```
lib/
├── core/
│   ├── api/              # API client, interceptors
│   ├── constants/        # App constants
│   ├── errors/           # Exception handling
│   ├── routes/           # Navigation routes
│   ├── theme/            # App theme & colors
│   └── utils/            # Utilities
├── features/
│   ├── auth/             # Authentication module
│   ├── attendance/       # Attendance module
│   ├── leave/            # Leave management module
│   ├── expense/          # Expense management module
│   ├── profile/          # Profile module
│   ├── dashboard/        # Dashboard module
│   └── reports/          # Reports module
├── shared/
│   ├── models/           # Shared data models
│   └── widgets/          # Reusable widgets
└── main.dart             # App entry point
```

### Architecture Layers

Each feature follows this structure:

```
feature/
├── data/
│   ├── models/           # Data models
│   ├── repositories/     # Data repositories
│   └── sources/          # API data sources
└── presentation/
    ├── pages/            # UI pages
    ├── widgets/          # Feature widgets
    └── providers/        # State management
```

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.0+ |
| **Language** | Dart 3.0+ |
| **State Management** | Riverpod 2.4+ |
| **Navigation** | go_router 13.0+ |
| **HTTP Client** | Dio 5.4+ |
| **Local Storage** | Hive 2.2+, SharedPreferences |
| **Location** | Geolocator, Google Maps |
| **Camera** | image_picker, camera |
| **QR Scanner** | qr_code_scanner |
| **Notifications** | Firebase Cloud Messaging |
| **UI Components** | Material Design 3 |
| **Fonts** | Google Fonts (Poppins) |

## 📦 Installation

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Setup Steps

1. **Clone the repository**
   ```bash
   cd mobile_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API endpoint**

   Update the base URL in `lib/core/constants/api_constants.dart`:
   ```dart
   static const String baseUrl = 'https://your-hrm-domain.com';
   ```

4. **Generate code (for JSON serialization)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   # Debug mode
   flutter run

   # Release mode
   flutter run --release
   ```

## 🔧 Configuration

### Firebase Setup (Optional)

1. Add your `google-services.json` (Android) to `android/app/`
2. Add your `GoogleService-Info.plist` (iOS) to `ios/Runner/`
3. Update Firebase configuration in the app

### Environment Variables

Create environment-specific configurations:

- Development: `lib/core/constants/env_dev.dart`
- Production: `lib/core/constants/env_prod.dart`

## 🎨 UI/UX

- **Design System**: Material Design 3
- **Color Scheme**: Customizable (defined in `app_colors.dart`)
- **Typography**: Poppins font family
- **Responsive**: Uses `flutter_screenutil` for responsive design
- **Dark Mode**: Supported (theme switching available)

## 📡 API Integration

### Authentication

The app uses **Laravel Sanctum** token-based authentication:

```dart
// Login
POST /api/V11/login
Body: { email, password }
Response: { token, user }

// Logout
GET /api/V11/logout
Headers: { Authorization: Bearer <token> }
```

### API Endpoints

All API endpoints are defined in `lib/core/constants/api_constants.dart`:

- **Auth**: Login, Logout, Reset Password
- **Profile**: Get/Update Profile, Change Password
- **Attendance**: Check-in, Check-out, Breaks
- **Leave**: List, Request, Approve
- **Expense**: List, Add, Claim

### Interceptors

- **AuthInterceptor**: Automatically adds bearer token
- **ErrorInterceptor**: Handles API errors gracefully
- **LoggerInterceptor**: Logs requests/responses (debug mode)

## 🗄️ Local Storage

Uses **Hive** for local caching:

- User data
- Auth tokens
- Cached attendance records
- Offline support

## 🔔 Push Notifications

Firebase Cloud Messaging integration:

- Real-time notifications
- Leave approval alerts
- Attendance reminders
- Announcement notifications

## 📱 Permissions Required

### Android
```xml
<!-- Location for attendance -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

<!-- Camera for QR scanning & profile picture -->
<uses-permission android:name="android.permission.CAMERA"/>

<!-- Storage for attachments -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

<!-- Internet -->
<uses-permission android:name="android.permission.INTERNET"/>
```

### iOS
Add to `Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location for attendance tracking</string>
<key>NSCameraUsageDescription</key>
<string>Camera access for QR scanning and profile pictures</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Photo library access for profile pictures</string>
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test

# Generate coverage
flutter test --coverage
```

## 📦 Build & Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 📂 Project Structure

```
mobile_app/
├── android/                 # Android native code
├── ios/                     # iOS native code
├── lib/
│   ├── core/               # Core functionality
│   ├── features/           # Feature modules
│   ├── shared/             # Shared resources
│   └── main.dart           # Entry point
├── assets/
│   ├── images/             # Image assets
│   ├── icons/              # Icon assets
│   ├── animations/         # Lottie animations
│   └── fonts/              # Custom fonts
├── test/                   # Unit tests
├── integration_test/       # Integration tests
├── pubspec.yaml            # Dependencies
└── README.md               # This file
```

## 🔐 Security

- **Token Storage**: Secure storage using `flutter_secure_storage`
- **Biometric Auth**: Local authentication for quick login
- **SSL Pinning**: (Optional) Can be implemented
- **Encrypted Storage**: Hive encryption for sensitive data

## 🎯 Roadmap

### Upcoming Features

- [ ] Offline mode with sync
- [ ] Face recognition for attendance
- [ ] Real-time location tracking
- [ ] Video conferencing integration
- [ ] Task management
- [ ] Payslip viewer
- [ ] Performance reviews
- [ ] Team chat
- [ ] Calendar integration
- [ ] Multi-language support

## 🐛 Troubleshooting

### Common Issues

1. **Build fails with dependency errors**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **iOS build fails**
   ```bash
   cd ios
   pod install
   cd ..
   flutter run
   ```

3. **API connection issues**
   - Check base URL in `api_constants.dart`
   - Verify internet connection
   - Check API server status

## 📝 Code Generation

For models with JSON serialization:

```bash
# Watch mode (auto-regenerate on file changes)
flutter pub run build_runner watch

# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## 📄 License

This project is proprietary software. All rights reserved.

## 📞 Support

For issues and questions:
- Email: support@yourcompany.com
- Documentation: https://docs.yourcompany.com

## 👥 Authors

- **Development Team** - Initial work

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for state management
- All open-source contributors

---

**Version**: 1.0.0
**Last Updated**: December 2024
**Minimum Flutter Version**: 3.0.0
**Minimum Dart Version**: 3.0.0
