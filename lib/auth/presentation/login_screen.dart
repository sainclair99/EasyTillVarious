import 'package:app_based_on_bloc/auth/business_logic/cubit/auth_cubit.dart';
import 'package:app_based_on_bloc/shared/widgets/app_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../product/business_logic/cubit/product_cubit.dart';
import '../../service_locator.dart';
import '../../shared/routes/routes.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/widgets/app_input.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state.errorLoginging) {
            // TO COMPLETE
          }

          if (state.successLoginging) {
            // TO COMPLETE
            getIt.get<ProductCubit>().getProducts();
            // await AppSnackBar.showSuccess(
            //   message: "Welcome ${state.user?.name}",
            //   context: context,
            // );

            context.router.pushAndPopUntil(
              const ApplicationRoute(),
              predicate: (_) => false,
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: screenWidth * 0.95,
                      height: screenHeight * 0.53,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.secondaryColor,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text(
                                'Sign in to your account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              AppInput(
                                controller: _emailController,
                                hint: 'Enter your email',
                                keyboardType: TextInputType.emailAddress,
                                validators: [
                                  FormBuilderValidators.required(
                                    errorText: 'Email is required',
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: 'Enter a valid email address',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              AppInput(
                                controller: _passwordController,
                                hint: 'Enter your password',
                                keyboardType: TextInputType.visiblePassword,
                                validators: [
                                  FormBuilderValidators.required(
                                    errorText: 'Password is required',
                                  ),
                                  FormBuilderValidators.match(
                                    '[A-Z][a-zA-Z0-9]+',
                                  ),
                                ],
                              )
                            ],
                          ),
                          AppButton(
                            loadingColor: AppColors.whiteGrey,
                            bgColor: AppColors.primaryColor,
                            loading: state.isLoginging,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                      email: _emailController.text,
                                      password: _passwordController.text.trim(),
                                    );
                              }
                            },
                            child: const Text(
                              'Sing In',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
