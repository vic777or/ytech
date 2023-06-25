import '../data/model/login_model.dart';

abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateLoaded extends AuthState {
  final LoginModel loginModel;

  AuthStateLoaded({required this.loginModel});
}

class AuthStateFailure extends AuthState {
  final String message;

  AuthStateFailure({required this.message});
}
