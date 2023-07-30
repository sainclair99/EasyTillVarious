import 'package:app_based_on_bloc/product/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio dio;
  ProductRepository({required this.dio});

  Future<List<ProductModel>> getProduts({required int shopId}) async {
    Response response = await dio.get('/api/shops/$shopId/products');

    List<ProductModel> products = [];

    for (var jsonProduct in response.data) {
      products.add(ProductModel.fromJson(jsonProduct));
    }

    return products;
  }
}
