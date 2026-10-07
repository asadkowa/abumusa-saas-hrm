import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String? employeeId;

  @JsonKey(name: 'department_id')
  final int? departmentId;

  @JsonKey(name: 'department_name')
  final String? departmentName;

  @JsonKey(name: 'designation_id')
  final int? designationId;

  @JsonKey(name: 'designation_name')
  final String? designationName;

  @JsonKey(name: 'shift_id')
  final int? shiftId;

  @JsonKey(name: 'shift_name')
  final String? shiftName;

  @JsonKey(name: 'branch_id')
  final int? branchId;

  @JsonKey(name: 'branch_name')
  final String? branchName;

  @JsonKey(name: 'role_id')
  final int? roleId;

  @JsonKey(name: 'role_name')
  final String? roleName;

  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;

  @JsonKey(name: 'joining_date')
  final String? joiningDate;

  final String? gender;
  final String? address;
  final String? city;
  final String? country;

  @JsonKey(name: 'blood_group')
  final String? bloodGroup;

  @JsonKey(name: 'emergency_contact')
  final String? emergencyContact;

  final String? status;

  @JsonKey(name: 'is_face_registered')
  final bool? isFaceRegistered;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    this.employeeId,
    this.departmentId,
    this.departmentName,
    this.designationId,
    this.designationName,
    this.shiftId,
    this.shiftName,
    this.branchId,
    this.branchName,
    this.roleId,
    this.roleName,
    this.dateOfBirth,
    this.joiningDate,
    this.gender,
    this.address,
    this.city,
    this.country,
    this.bloodGroup,
    this.emergencyContact,
    this.status,
    this.isFaceRegistered,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? employeeId,
    int? departmentId,
    String? departmentName,
    int? designationId,
    String? designationName,
    int? shiftId,
    String? shiftName,
    int? branchId,
    String? branchName,
    int? roleId,
    String? roleName,
    String? dateOfBirth,
    String? joiningDate,
    String? gender,
    String? address,
    String? city,
    String? country,
    String? bloodGroup,
    String? emergencyContact,
    String? status,
    bool? isFaceRegistered,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      employeeId: employeeId ?? this.employeeId,
      departmentId: departmentId ?? this.departmentId,
      departmentName: departmentName ?? this.departmentName,
      designationId: designationId ?? this.designationId,
      designationName: designationName ?? this.designationName,
      shiftId: shiftId ?? this.shiftId,
      shiftName: shiftName ?? this.shiftName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      joiningDate: joiningDate ?? this.joiningDate,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      status: status ?? this.status,
      isFaceRegistered: isFaceRegistered ?? this.isFaceRegistered,
    );
  }
}
