import '../data/login_models/login_model.dart';

abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateLoaded extends AuthState {
  final LoginModel loginModel;

  AuthStateLoaded({required this.loginModel});
}

class AuthStateCheckLogIn extends AuthState {
  final bool isLoggedIn;

  AuthStateCheckLogIn({required this.isLoggedIn});
}

class AuthStateFailure extends AuthState {
  final String message;

  AuthStateFailure({required this.message});
}
