import 'package:equatable/equatable.dart';

import '../data/login_models/login_body_mode.dart';

abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginAuthEvent extends AuthEvent {
  final LoginBodyModel loginBodyModel;

  LoginAuthEvent({required this.loginBodyModel});
}

class CheckLoginAuthEvent extends AuthEvent {}
