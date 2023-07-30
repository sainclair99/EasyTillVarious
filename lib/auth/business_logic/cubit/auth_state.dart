// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
class AuthState {
  final UserModel? user;
  final bool isLoginging;
  final bool successLoginging;
  final bool errorLoginging;
  final String? message;

  //?
  final bool isCheckingAuthState;
  final bool succesCheckingAuthState;
  final bool errorCheckingAuthState;

  const AuthState({
    this.user,
    this.isLoginging = false,
    this.successLoginging = false,
    this.errorLoginging = false,
    this.message,

    //?
    this.isCheckingAuthState = false,
    this.succesCheckingAuthState = false,
    this.errorCheckingAuthState = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoginging,
    bool? successLoginging,
    bool? errorLoginging,
    String? message,
    bool? isCheckingAuthState,
    bool? succesCheckingAuthState,
    bool? errorCheckingAuthState,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoginging: isLoginging ?? this.isLoginging,
      successLoginging: successLoginging ?? this.successLoginging,
      errorLoginging: errorLoginging ?? this.errorLoginging,
      message: message ?? this.message,
      isCheckingAuthState: isCheckingAuthState ?? this.isCheckingAuthState,
      succesCheckingAuthState: succesCheckingAuthState ?? this.succesCheckingAuthState,
      errorCheckingAuthState: errorCheckingAuthState ?? this.errorCheckingAuthState,
    );
  }
}
