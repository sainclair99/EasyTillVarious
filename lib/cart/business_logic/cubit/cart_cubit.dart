import 'package:app_based_on_bloc/product/data/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(
          CartState(
            productsInCart: [],
          ),
        );

  getIndex(ProductModel productModel) =>
      state.productsInCart.indexWhere((item) => item.id == productModel.id);

  isInCart(ProductModel productModel) => getIndex(productModel) >= 0;

  addToCart(ProductModel product) {
    if (isInCart(product)) {
      var index = getIndex(product);

      List<ProductModel> products = [...state.productsInCart];

      products[index].quantity = products[index].quantity! + 1;

      emit(
        state.copyWith(productsInCart: products),
      );
    } else {
      List<ProductModel> products = [...state.productsInCart];

      products.add(
        product.copyWith(quantity: 1),
      );

      emit(state.copyWith(
        productsInCart: products,
      ));
    }
  }
}
