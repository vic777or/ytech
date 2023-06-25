import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/auth_api.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final DioAuth dioAuth;

  AuthBloc(this.dioAuth) : super(AuthStateInitial()) {
    on<LoginAuthEvent>(_login);
  }

  void _login(LoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthStateLoading());

      var res = await dioAuth.login(loginBodyModel: event.loginBodyModel);

      emit(AuthStateLoaded(loginModel: res));
    } catch (err) {
      emit(
        AuthStateFailure(message: err.toString()),
      );
    }
  }
}
