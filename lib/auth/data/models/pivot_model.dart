class PivotModel {
  int? entityId;
  int? roleId;
  String? entityType;
  dynamic scope;

  PivotModel({
    this.entityId,
    this.roleId,
    this.entityType,
    this.scope,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) => PivotModel(
        entityId: json['entity_id'] as int?,
        roleId: json['role_id'] as int?,
        entityType: json['entity_Type'] as String?,
        scope: json['scope'],
      );
}
