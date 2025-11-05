import 'package:json_annotation/json_annotation.dart';

part 'leave_model.g.dart';

@JsonSerializable()
class LeaveModel {
  final int? id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'leave_type_id')
  final int leaveTypeId;

  @JsonKey(name: 'leave_type_name')
  final String? leaveTypeName;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'total_days')
  final int totalDays;

  final String? reason;
  final String? status;

  @JsonKey(name: 'approved_by')
  final int? approvedBy;

  @JsonKey(name: 'approved_by_name')
  final String? approvedByName;

  @JsonKey(name: 'approved_at')
  final String? approvedAt;

  @JsonKey(name: 'reject_reason')
  final String? rejectReason;

  @JsonKey(name: 'substitute_id')
  final int? substituteId;

  @JsonKey(name: 'substitute_name')
  final String? substituteName;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'attachment')
  final String? attachment;

  LeaveModel({
    this.id,
    required this.userId,
    required this.leaveTypeId,
    this.leaveTypeName,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    this.reason,
    this.status,
    this.approvedBy,
    this.approvedByName,
    this.approvedAt,
    this.rejectReason,
    this.substituteId,
    this.substituteName,
    this.createdAt,
    this.attachment,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);

  bool get isPending => status?.toLowerCase() == 'pending';
  bool get isApproved => status?.toLowerCase() == 'approved';
  bool get isRejected => status?.toLowerCase() == 'rejected';
  bool get isCancelled => status?.toLowerCase() == 'cancelled';

  LeaveModel copyWith({
    int? id,
    int? userId,
    int? leaveTypeId,
    String? leaveTypeName,
    String? startDate,
    String? endDate,
    int? totalDays,
    String? reason,
    String? status,
    int? approvedBy,
    String? approvedByName,
    String? approvedAt,
    String? rejectReason,
    int? substituteId,
    String? substituteName,
    String? createdAt,
    String? attachment,
  }) {
    return LeaveModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      leaveTypeId: leaveTypeId ?? this.leaveTypeId,
      leaveTypeName: leaveTypeName ?? this.leaveTypeName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalDays: totalDays ?? this.totalDays,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      approvedBy: approvedBy ?? this.approvedBy,
      approvedByName: approvedByName ?? this.approvedByName,
      approvedAt: approvedAt ?? this.approvedAt,
      rejectReason: rejectReason ?? this.rejectReason,
      substituteId: substituteId ?? this.substituteId,
      substituteName: substituteName ?? this.substituteName,
      createdAt: createdAt ?? this.createdAt,
      attachment: attachment ?? this.attachment,
    );
  }
}

@JsonSerializable()
class LeaveTypeModel {
  final int id;
  final String name;

  @JsonKey(name: 'total_days')
  final int totalDays;

  @JsonKey(name: 'used_days')
  final int? usedDays;

  @JsonKey(name: 'remaining_days')
  final int? remainingDays;

  LeaveTypeModel({
    required this.id,
    required this.name,
    required this.totalDays,
    this.usedDays,
    this.remainingDays,
  });

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeModelToJson(this);
}

@JsonSerializable()
class LeaveSummaryModel {
  @JsonKey(name: 'total_leaves')
  final int totalLeaves;

  @JsonKey(name: 'used_leaves')
  final int usedLeaves;

  @JsonKey(name: 'remaining_leaves')
  final int remainingLeaves;

  @JsonKey(name: 'pending_leaves')
  final int? pendingLeaves;

  @JsonKey(name: 'leave_types')
  final List<LeaveTypeModel>? leaveTypes;

  LeaveSummaryModel({
    required this.totalLeaves,
    required this.usedLeaves,
    required this.remainingLeaves,
    this.pendingLeaves,
    this.leaveTypes,
  });

  factory LeaveSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveSummaryModelToJson(this);
}
