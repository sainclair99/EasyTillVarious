import 'package:app_based_on_bloc/auth/data/models/rule_model.dart';

class UserModel {
  int id;
  String name;
  String email;
  String? emailVerifiedAt;
  int shopId;
  int? active;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<RoleModel>? roles;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.shopId,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        emailVerifiedAt: json['email_verified_at'] as String?,
        shopId: json['shop_id'] as int,
        active: json['active'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        deletedAt: json['deleted_at'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => RoleModel.fromJson(e))
            .toList(),
      );
}
