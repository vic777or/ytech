import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ytech/core/utils/const.dart';
import 'package:ytech/core/utils/shared_preferences.dart';
import 'package:ytech/main.dart';

import '../data/auth_api.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final DioAuth dioAuth;

  AuthBloc(this.dioAuth) : super(AuthStateInitial()) {
    on<LoginAuthEvent>(_login);
    on<CheckLoginAuthEvent>(_checkLogin);
  }

  void _login(LoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthStateLoading());
      var res = await dioAuth.login(loginBodyModel: event.loginBodyModel);
      await sharedFunction.setShared(
          PrefKeys.accessToken, res.result?.data?.accessToken ?? '');
      await sharedFunction.setShared(
          PrefKeys.terminalKey, event.loginBodyModel.terminlKey ?? '');
      emit(AuthStateLoaded(loginModel: res));
    } catch (err) {
      emit(
        AuthStateFailure(message: err.toString()),
      );
    }
  }

  void _checkLogin(CheckLoginAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthStateLoading());
      String token = await getToken();
      emit(AuthStateCheckLogIn(isLoggedIn: token.isNotEmpty));
    } catch (err) {
      emit(
        AuthStateFailure(message: err.toString()),
      );
    }
  }
}
