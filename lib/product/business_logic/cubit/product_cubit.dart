import 'package:app_based_on_bloc/auth/business_logic/cubit/auth_cubit.dart';
import 'package:app_based_on_bloc/product/data/models/product_model.dart';
import 'package:app_based_on_bloc/product/data/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';
import '../../../shared/utils/utils.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit({
    required this.productRepository,
  }) : super(ProductState());

  getProducts() async {

    emit(state.copyWith(
      isLoadingProduct: true,
      successLoadingProduct: false,
      errorLoadingProduct: false,
    ));

    try {
      var user = getIt.get<AuthCubit>().state.user;

      var products = await productRepository.getProduts(
        shopId: user!.shopId,
      );

      emit(state.copyWith(
        products: products,
        isLoadingProduct: false,
        successLoadingProduct: true,
        errorLoadingProduct: false,
      ));
    } catch (e) {

      emit(state.copyWith(
        isLoadingProduct: false,
        successLoadingProduct: false,
        errorLoadingProduct: true,
        message: Utils.extractMessage(e),
      ));

    }
  }
}
