/// API related constants
class ApiConstants {
  ApiConstants._();

  // Base URL - Update this with your actual API URL
  static const String baseUrl = 'https://your-domain.com';

  // API Version
  static const String apiVersion = 'V11';
  static const String apiVersionV3 = '3.0';

  // API Base Path
  static String get apiBasePath => '/api/$apiVersion';

  // Timeout
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Headers
  static const String contentTypeJson = 'application/json';
  static const String acceptJson = 'application/json';

  // Auth Endpoints
  static const String login = '/login';
  static const String logout = '/logout';
  static const String logoutAllDevices = '/logout-all-devices';
  static const String resetPassword = '/reset-password';
  static const String changePassword = '/change-password';
  static const String companyList = '/company-list';

  // User Profile Endpoints
  static const String userProfile = '/user/profile-info';
  static const String userDetails = '/user/details';
  static const String userProfileUpdate = '/user/profile-update';
  static const String userPasswordUpdate = '/user/password-update';
  static const String userAvatarUpdate = '/user/avatar-update';
  static const String userNotifications = '/user/notification';
  static const String readNotification = '/user/read-notification';
  static const String clearNotifications = '/user/notification/clear';

  // Face Recognition
  static const String faceRecognition = '/user/face-recognition';
  static const String getFaceData = '/user/get-face-data';
  static const String faceRecognitionUpdate = '/user/face-recognition-update';
  static const String faceRecognitionDelete = '/user/face-recognition-delete';

  // Attendance Endpoints
  static const String checkIn = '/user/attendance/check-in';
  static const String checkOut = '/user/attendance/check-out';
  static const String attendanceStatus = '/user/attendance/get-checkin-checkout-status';
  static const String breakStart = '/user/attendance/break-back/start';
  static const String breakEnd = '/user/attendance/break-back/end';
  static const String breakHistory = '/user/attendance/break-history';
  static const String lateInReason = '/user/attendance/late-in-reason';
  static const String liveLocationStore = '/user/attendance/live-location-store';
  static const String qrStatus = '/user/attendance/qr-status';

  // Leave Endpoints
  static const String leaveSummary = '/user/leave/summary';
  static const String availableLeave = '/user/leave/available';
  static const String leaveList = '/user/leave/list/view';
  static const String leaveRequest = '/user/leave/request';
  static const String leaveDetails = '/user/leave/details';
  static const String leaveUpdate = '/user/leave/request/update';
  static const String cancelLeave = '/user/leave/request/cancel';
  static const String leaveApprovalList = '/user/leave/approval/list/view';
  static const String leaveStatusChange = '/user/leave/approval/status-change';
  static const String teamMemberLeaves = '/user/leave/team-member';

  // Expense Endpoints
  static const String expenseCategory = '/expense/category';
  static const String expenseList = '/expense/list';
  static const String expenseAdd = '/expense/add';
  static const String expenseUpdate = '/expense/update';
  static const String expenseDelete = '/expense/delete';
  static const String sendClaim = '/expense/send-claim';
  static const String claimHistory = '/expense/claim-history';
  static const String claimDetails = '/expense/claim-details';
  static const String paymentHistory = '/expense/payment-history';

  // Dashboard
  static const String dashboardStats = '/dashboard/statistics';

  // Reports
  static const String attendanceMonthlyReport = '/report/attendance/particular-month';
  static const String attendanceDateSummary = '/report/attendance/date-summary';
  static const String leaveDateSummary = '/report/leave/date-summary';
  static const String payslipList = '/report/payslip/list';
  static const String payslipShow = '/report/payslip/show';

  // Tasks
  static const String tasksList = '/tasks/list';
  static const String taskDetails = '/tasks';
  static const String taskCreate = '/tasks/store';
  static const String taskUpdate = '/tasks/update';
  static const String taskDelete = '/tasks/delete';
  static const String taskChangeStatus = '/tasks/change-status';

  // Meetings
  static const String meetingList = '/meeting';
  static const String meetingCreate = '/meeting/create';
  static const String meetingShow = '/meeting/show';

  // Support Tickets
  static const String supportTicketList = '/support-ticket/list';
  static const String supportTicketAdd = '/support-ticket/add';
  static const String supportTicketShow = '/support-ticket/show';

  // Notices
  static const String noticeList = '/notice/list';
  static const String noticeShow = '/notice/show';

  // App Settings
  static const String baseSettings = '/app/base-settings';
  static const String homeScreen = '/app/home-screen';
  static const String getDepartment = '/app/get-department';
  static const String getDesignation = '/app/get-designation';

  // File Upload
  static const String fileUpload = '/file-upload';

  // Firebase Token
  static const String firebaseToken = '/user/firebase-token';
}
