import 'package:json_annotation/json_annotation.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel {
  final int? id;

  @JsonKey(name: 'user_id')
  final int userId;

  final String date;

  @JsonKey(name: 'check_in')
  final String? checkIn;

  @JsonKey(name: 'check_out')
  final String? checkOut;

  @JsonKey(name: 'in_time')
  final String? inTime;

  @JsonKey(name: 'out_time')
  final String? outTime;

  @JsonKey(name: 'late_time')
  final String? lateTime;

  @JsonKey(name: 'early_leave_time')
  final String? earlyLeaveTime;

  @JsonKey(name: 'total_hours')
  final String? totalHours;

  @JsonKey(name: 'break_time')
  final String? breakTime;

  final String? status;

  @JsonKey(name: 'check_in_latitude')
  final double? checkInLatitude;

  @JsonKey(name: 'check_in_longitude')
  final double? checkInLongitude;

  @JsonKey(name: 'check_out_latitude')
  final double? checkOutLatitude;

  @JsonKey(name: 'check_out_longitude')
  final double? checkOutLongitude;

  @JsonKey(name: 'check_in_location')
  final String? checkInLocation;

  @JsonKey(name: 'check_out_location')
  final String? checkOutLocation;

  @JsonKey(name: 'late_reason')
  final String? lateReason;

  @JsonKey(name: 'is_late')
  final bool? isLate;

  @JsonKey(name: 'is_early_leave')
  final bool? isEarlyLeave;

  @JsonKey(name: 'is_on_break')
  final bool? isOnBreak;

  AttendanceModel({
    this.id,
    required this.userId,
    required this.date,
    this.checkIn,
    this.checkOut,
    this.inTime,
    this.outTime,
    this.lateTime,
    this.earlyLeaveTime,
    this.totalHours,
    this.breakTime,
    this.status,
    this.checkInLatitude,
    this.checkInLongitude,
    this.checkOutLatitude,
    this.checkOutLongitude,
    this.checkInLocation,
    this.checkOutLocation,
    this.lateReason,
    this.isLate,
    this.isEarlyLeave,
    this.isOnBreak,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);

  bool get isCheckedIn => checkIn != null && checkOut == null;
  bool get isCheckedOut => checkIn != null && checkOut != null;
  bool get hasNotCheckedIn => checkIn == null;

  AttendanceModel copyWith({
    int? id,
    int? userId,
    String? date,
    String? checkIn,
    String? checkOut,
    String? inTime,
    String? outTime,
    String? lateTime,
    String? earlyLeaveTime,
    String? totalHours,
    String? breakTime,
    String? status,
    double? checkInLatitude,
    double? checkInLongitude,
    double? checkOutLatitude,
    double? checkOutLongitude,
    String? checkInLocation,
    String? checkOutLocation,
    String? lateReason,
    bool? isLate,
    bool? isEarlyLeave,
    bool? isOnBreak,
  }) {
    return AttendanceModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      inTime: inTime ?? this.inTime,
      outTime: outTime ?? this.outTime,
      lateTime: lateTime ?? this.lateTime,
      earlyLeaveTime: earlyLeaveTime ?? this.earlyLeaveTime,
      totalHours: totalHours ?? this.totalHours,
      breakTime: breakTime ?? this.breakTime,
      status: status ?? this.status,
      checkInLatitude: checkInLatitude ?? this.checkInLatitude,
      checkInLongitude: checkInLongitude ?? this.checkInLongitude,
      checkOutLatitude: checkOutLatitude ?? this.checkOutLatitude,
      checkOutLongitude: checkOutLongitude ?? this.checkOutLongitude,
      checkInLocation: checkInLocation ?? this.checkInLocation,
      checkOutLocation: checkOutLocation ?? this.checkOutLocation,
      lateReason: lateReason ?? this.lateReason,
      isLate: isLate ?? this.isLate,
      isEarlyLeave: isEarlyLeave ?? this.isEarlyLeave,
      isOnBreak: isOnBreak ?? this.isOnBreak,
    );
  }
}

@JsonSerializable()
class BreakModel {
  final int? id;

  @JsonKey(name: 'attendance_id')
  final int attendanceId;

  @JsonKey(name: 'break_start')
  final String breakStart;

  @JsonKey(name: 'break_end')
  final String? breakEnd;

  @JsonKey(name: 'break_duration')
  final String? breakDuration;

  final String? reason;

  BreakModel({
    this.id,
    required this.attendanceId,
    required this.breakStart,
    this.breakEnd,
    this.breakDuration,
    this.reason,
  });

  factory BreakModel.fromJson(Map<String, dynamic> json) =>
      _$BreakModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreakModelToJson(this);

  bool get isOnBreak => breakEnd == null;
}
