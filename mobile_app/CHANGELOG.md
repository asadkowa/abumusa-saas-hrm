# Changelog

All notable changes to the HRM Mobile App will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-12-20

### Added

#### Authentication
- Email/password login
- Token-based authentication with Laravel Sanctum
- Logout functionality (single device & all devices)
- Password reset flow
- Biometric authentication support
- Auto-login with saved credentials

#### Dashboard
- Welcome screen with user info
- Quick action cards for main features
- Today's attendance summary
- Working hours display
- Bottom navigation bar

#### Attendance Management
- GPS-based check-in/check-out
- Location tracking
- Break management (start/end)
- Late arrival reason submission
- Attendance history view
- Monthly statistics (present, absent, late)
- QR code scanning support (ready for backend integration)

#### Leave Management
- Leave balance display
- Leave request submission
- Leave history with status tracking
- Multiple leave types support
- Leave approval workflow
- Date range selection

#### Expense Management
- Expense submission with attachments
- Multiple expense categories
- Expense claim history
- Status tracking (pending, approved, rejected)
- Payment history

#### Profile Management
- View user profile
- Edit profile information
- Change password
- Upload profile picture
- App settings:
  - Notifications toggle
  - Dark mode toggle
  - Biometric authentication toggle
- Logout option

#### Core Features
- Clean Architecture implementation
- Feature-based project structure
- Riverpod state management
- Go Router navigation
- Dio HTTP client with interceptors
- Error handling
- Hive local storage
- Material Design 3 UI
- Custom app theme
- Responsive design with ScreenUtil
- Pull-to-refresh support
- Loading states
- Empty states

### Technical

#### Dependencies
- Flutter 3.0+
- Riverpod 2.4.9 (state management)
- go_router 13.0.0 (navigation)
- dio 5.4.0 (HTTP client)
- hive 2.2.3 (local storage)
- geolocator 11.0.0 (GPS)
- image_picker 1.0.7 (camera/gallery)
- qr_code_scanner 1.0.1 (QR scanning)
- firebase_core & firebase_messaging (push notifications)
- flutter_screenutil 5.9.0 (responsive UI)
- google_fonts 6.1.0 (typography)

#### Code Quality
- Lint rules configured
- Clean architecture
- Repository pattern
- Dependency injection
- Error handling
- Code generation for models
- Type safety

### Security
- Token-based authentication
- Secure local storage
- Biometric authentication
- API interceptors for auth
- SSL/TLS support

## [Unreleased]

### Planned Features

#### v1.1.0
- [ ] Offline mode with data sync
- [ ] Face recognition attendance
- [ ] Real-time location tracking
- [ ] Task management module
- [ ] Payslip viewer
- [ ] Multi-language support (Arabic, English)

#### v1.2.0
- [ ] Video conferencing integration
- [ ] Team chat
- [ ] Calendar integration
- [ ] Performance reviews
- [ ] Document viewer
- [ ] Notification center

#### v1.3.0
- [ ] Advanced analytics
- [ ] Custom reports
- [ ] Export data (PDF, Excel)
- [ ] Widget home screen
- [ ] Smartwatch support

### Known Issues
- None reported yet

### Deprecated
- None

---

**Note:** Dates follow YYYY-MM-DD format.
