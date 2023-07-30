import 'package:app_based_on_bloc/auth/business_logic/cubit/auth_cubit.dart';
import 'package:app_based_on_bloc/auth/data/repositories/auth_repository.dart';
import 'package:app_based_on_bloc/cart/business_logic/cubit/cart_cubit.dart';
import 'package:app_based_on_bloc/product/business_logic/cubit/product_cubit.dart';
import 'package:app_based_on_bloc/product/data/repositories/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interceptor.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingletonAsync(
    () => SharedPreferences.getInstance(),
  );

  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://www.till-api.ntech-services.com',
        headers: {
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(
        TokenInterceptor(),
      ),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(dio: getIt.get<Dio>()),
  );

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerSingleton<ProductRepository>(
    ProductRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<ProductCubit>(
    ProductCubit(
      productRepository: getIt.get<ProductRepository>(),
    ),
  );

  getIt.registerSingleton<CartCubit>(
    CartCubit(),
  );
}
