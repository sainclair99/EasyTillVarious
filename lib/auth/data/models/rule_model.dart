import 'pivot_model.dart';

class RoleModel {
  int? id;
  String? name;
  String? title;
  dynamic scope;
  String? createdAt;
  String? updatedAt;
  PivotModel? pivot;

  RoleModel({
    this.id,
    this.name,
    this.title,
    this.scope,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        title: json['title'] as String?,
        scope: json['scope'],
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        pivot: json['pivot'] == null
            ? null
            : PivotModel.fromJson(json["pivot"] as Map<String, dynamic>),
      );
}
