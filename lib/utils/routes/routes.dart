import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import 'package:boilerplate/ui/auth/login/forgot_password.dart';
import 'package:boilerplate/ui/auth/login/login.dart';
import 'package:boilerplate/ui/auth/login/sign_up.dart';
import 'package:boilerplate/ui/app/main.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String main = '/main';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    main: (BuildContext context) => MainScreen(),
  };
}
