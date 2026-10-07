import 'package:json_annotation/json_annotation.dart';

part 'expense_model.g.dart';

@JsonSerializable()
class ExpenseModel {
  final int? id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'category_name')
  final String? categoryName;

  final String? description;
  final double amount;
  final String date;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  final String? attachment;
  final String? status;

  @JsonKey(name: 'claim_id')
  final int? claimId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  ExpenseModel({
    this.id,
    required this.userId,
    required this.categoryId,
    this.categoryName,
    this.description,
    required this.amount,
    required this.date,
    this.paymentMethod,
    this.attachment,
    this.status,
    this.claimId,
    this.createdAt,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  bool get isPending => status?.toLowerCase() == 'pending';
  bool get isApproved => status?.toLowerCase() == 'approved';
  bool get isRejected => status?.toLowerCase() == 'rejected';
  bool get isClaimed => claimId != null;

  ExpenseModel copyWith({
    int? id,
    int? userId,
    int? categoryId,
    String? categoryName,
    String? description,
    double? amount,
    String? date,
    String? paymentMethod,
    String? attachment,
    String? status,
    int? claimId,
    String? createdAt,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      attachment: attachment ?? this.attachment,
      status: status ?? this.status,
      claimId: claimId ?? this.claimId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

@JsonSerializable()
class ExpenseCategoryModel {
  final int id;
  final String name;
  final String? description;
  final String? icon;

  ExpenseCategoryModel({
    required this.id,
    required this.name,
    this.description,
    this.icon,
  });

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseCategoryModelToJson(this);
}

@JsonSerializable()
class ExpenseClaimModel {
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'total_amount')
  final double totalAmount;

  @JsonKey(name: 'claim_date')
  final String claimDate;

  final String status;

  @JsonKey(name: 'approved_by')
  final int? approvedBy;

  @JsonKey(name: 'approved_by_name')
  final String? approvedByName;

  @JsonKey(name: 'approved_at')
  final String? approvedAt;

  @JsonKey(name: 'reject_reason')
  final String? rejectReason;

  @JsonKey(name: 'payment_date')
  final String? paymentDate;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @JsonKey(name: 'expense_count')
  final int? expenseCount;

  final List<ExpenseModel>? expenses;

  ExpenseClaimModel({
    required this.id,
    required this.userId,
    required this.totalAmount,
    required this.claimDate,
    required this.status,
    this.approvedBy,
    this.approvedByName,
    this.approvedAt,
    this.rejectReason,
    this.paymentDate,
    this.paymentMethod,
    this.expenseCount,
    this.expenses,
  });

  factory ExpenseClaimModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseClaimModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseClaimModelToJson(this);

  bool get isPending => status.toLowerCase() == 'pending';
  bool get isApproved => status.toLowerCase() == 'approved';
  bool get isRejected => status.toLowerCase() == 'rejected';
  bool get isPaid => paymentDate != null;
}
