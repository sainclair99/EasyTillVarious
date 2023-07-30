// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String name;
  String reference;
  String? description;
  int unitPrice;
  int? stockLimit;
  int shopId;
  int? stockManagment;
  int? quantity;
  String? image;
  int categoryId;
  String? createdAt;
  String? updatedAt;
  int? isPublic;
  int? isFeatured;
  int? publicPrice;
  String? deletedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.reference,
    this.description,
    required this.unitPrice,
    this.stockLimit,
    required this.shopId,
    this.stockManagment,
    this.quantity,
    this.image,
    required this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.isPublic,
    this.isFeatured,
    this.publicPrice,
    this.deletedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int,
        name: json['name'] as String,
        reference: json['reference'] as String,
        description: json['description'] as String?,
        unitPrice: json['unit_price'] as int,
        stockLimit: json['stock_limit'] as int?,
        shopId: json['shop_id'] as int,
        stockManagment: json['stock_managment'] as int?,
        quantity: json['quantity'] as int?,
        image: json['image'] as String?,
        categoryId: json['category_id'] as int,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        isPublic: json['is_public'] as int?,
        isFeatured: json['is_featured'] as int?,
        publicPrice: json['public_price'] as int?,
        deletedAt: json['deleted_at'] as String?,
      );

  ProductModel copyWith({
    int? id,
    String? name,
    String? reference,
    String? description,
    int? unitPrice,
    int? stockLimit,
    int? shopId,
    int? stockManagment,
    int? quantity,
    String? image,
    int? categoryId,
    String? createdAt,
    String? updatedAt,
    int? isPublic,
    int? isFeatured,
    int? publicPrice,
    String? deletedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      reference: reference ?? this.reference,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      stockLimit: stockLimit ?? this.stockLimit,
      shopId: shopId ?? this.shopId,
      stockManagment: stockManagment ?? this.stockManagment,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPublic: isPublic ?? this.isPublic,
      isFeatured: isFeatured ?? this.isFeatured,
      publicPrice: publicPrice ?? this.publicPrice,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
