import 'package:app_based_on_bloc/auth/business_logic/cubit/auth_cubit.dart';
import 'package:app_based_on_bloc/product/business_logic/cubit/product_cubit.dart';
import 'package:app_based_on_bloc/service_locator.dart';
import 'package:app_based_on_bloc/shared/routes/routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AppInitScreen extends StatelessWidget {
  const AppInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorCheckingAuthState) {
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (_) => false,
            );
          }

          if (state.succesCheckingAuthState) {
            getIt.get<ProductCubit>().getProducts();

            context.router.pushAndPopUntil(
              const ApplicationRoute(),
              predicate: (_) => false,
            );
          }
        },
        child: const Center(
          child: CupertinoActivityIndicator(
            radius: 70,
          ),
        ),
      ),
    );
  }
}
