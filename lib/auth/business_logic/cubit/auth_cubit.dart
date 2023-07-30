import 'package:app_based_on_bloc/auth/data/repositories/auth_repository.dart';
import 'package:app_based_on_bloc/shared/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(const AuthState());

  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(
        state.copyWith(
          isLoginging: true,
          successLoginging: false,
          errorLoginging: false,
        ),
      );

      var user = await authRepository.login(
        email: email,
        password: password,
      );

      emit(
        state.copyWith(
          user: user,
          isLoginging: false,
          successLoginging: true,
          errorLoginging: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoginging: false,
          successLoginging: false,
          errorLoginging: true,
          message: Utils.extractMessage(e),
        ),
      );
    }
  }

  checkAuthState() async {
    try {
      emit(
        state.copyWith(
          isCheckingAuthState: true,
          successLoginging: false,
          errorCheckingAuthState: false,
        ),
      );

      var user = await authRepository.getUser();

      emit(
        state.copyWith(
          user: user,
          isCheckingAuthState: false,
          succesCheckingAuthState: true,
          errorCheckingAuthState: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: Utils.extractMessage(e),
          isCheckingAuthState: false,
          succesCheckingAuthState: false,
          errorCheckingAuthState: true,
        ),
      );
    }
  }
}
