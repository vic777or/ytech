import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ytech/features/auth/bloc/auth_event.dart';

import '../../../custom_widgets/customized_text_field/customized_text_field.dart';
import '../../../gen/assets.gen.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../data/auth_api.dart';
import '../data/model/login_body_mode.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController terminalController = TextEditingController();
  final AuthBloc _authBloc = AuthBloc(DioAuth());
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    _authBloc.close();
  }

  callAuthBloc() {
    if (userNameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        terminalController.text.trim().isNotEmpty) {
      LoginBodyModel loginBodyModel = LoginBodyModel(
          userName: userNameController.text.trim(),
          password: passwordController.text.trim(),
          terminlKey: terminalController.text.trim());

      _authBloc.add(LoginAuthEvent(loginBodyModel: loginBodyModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateLoaded) {
              context.go('/CustomersPage');
            }
          },
          builder: (context, state) {
            if (state is AuthStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomizedTextField(
                      title: "User Name Or Mobile Number",
                      titleIcon: const Icon(Icons.person_outline_rounded),
                      controller: userNameController,
                    ),
                    SizedBox(
                      height: Adaptive.px(25),
                    ),
                    CustomizedTextField(
                      title: "Password",
                      titleIcon: const Icon(Icons.lock_open_rounded),
                      controller: passwordController,
                      isSecured: true,
                    ),
                    SizedBox(
                      height: Adaptive.px(25),
                    ),
                    CustomizedTextField(
                      title: "Terminal Key",
                      titleIcon: const RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: Icon(Icons.key_rounded)),
                      controller: terminalController,
                    ),
                    SizedBox(
                      height: Adaptive.px(45),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xfff1416c)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(70),
                                  vertical: Adaptive.px(20))),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {
                        callAuthBloc();
                      },
                      child: Text("Login",
                          style: TextStyle(
                            fontSize: Adaptive.px(16),
                          ),
                          textScaleFactor: 1.0),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    Assets.images.authMain.path,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
