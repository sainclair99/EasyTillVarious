import 'package:app_based_on_bloc/auth/business_logic/cubit/auth_cubit.dart';
import 'package:app_based_on_bloc/cart/business_logic/cubit/cart_cubit.dart';
import 'package:app_based_on_bloc/product/business_logic/cubit/product_cubit.dart';
import 'package:app_based_on_bloc/shared/routes/routes.dart';
import 'package:app_based_on_bloc/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'service_locator.dart';

class Application extends StatelessWidget {
  Application({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) {
          return getIt.get<AuthCubit>()..checkAuthState();
        }),
        BlocProvider<ProductCubit>(
          create: (context) => getIt.get<ProductCubit>(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => getIt.get<CartCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Easy Till',
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.bgColor,
          textTheme: const TextTheme(),
        ),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.dark),
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.bgColor,
        ),
      ),
    );
  }
}
