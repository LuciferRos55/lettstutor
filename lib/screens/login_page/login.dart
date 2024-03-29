import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettstutor/models/language_model/language.dart';
import 'package:lettstutor/models/language_model/language_en.dart';
import 'package:lettstutor/models/language_model/language_vi.dart';
import 'package:lettstutor/models/user_model/tokens_model.dart';
import 'package:lettstutor/models/user_model/user_model.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/screens/login_page/login_with.dart';
import 'package:lettstutor/services/auth_service.dart';
import 'package:lettstutor/widgets/button_expand.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:lettstutor/route.dart' as routes;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isAuthenticating = true;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    isAuthenticating = true;
    isAuthenticated = false;
  }

  callback(User user, Tokens tokens, AuthProvider authProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authProvider.logIn(user, tokens);
    await prefs.setString('refresh_token', authProvider.tokens!.refresh.token);
    if (mounted) {
      setState(() {
        isAuthenticating = false;
        isAuthenticated = true;
      });
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pop(context);
      Navigator.of(context).pushNamed(routes.homePage);
    });
  }

  void authenticate(AuthProvider authProvider) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh_token') ?? "";
      await AuthService.authenticate(refreshToken, authProvider, callback);
    } catch (e) {
      if (mounted) {
        setState(() {
          isAuthenticating = false;
        });
      }
    }
  }

  void handleLogin(Language language, AuthProvider authProvider) async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showTopSnackBar(context, CustomSnackBar.error(message: language.emptyField),
          showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
      return;
    }

    if (_passwordController.text.length < 6) {
      showTopSnackBar(context, CustomSnackBar.error(message: language.passwordTooShort),
          showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
      return;
    }

    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text)) {
      try {
        await AuthService.loginByEmailAndPassword(_emailController.text, _passwordController.text, authProvider, callback);
      } catch (e) {
        showTopSnackBar(context, CustomSnackBar.error(message: "Login failed! ${e.toString()}"),
            showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
      }
    } else {
      showTopSnackBar(context, CustomSnackBar.error(message: language.invalidEmail),
          showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
    }
  }

  void loadLangue(AppProvider appProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('lang') ?? "EN";
    if (lang == "EN") {
      appProvider.language = English();
    } else {
      appProvider.language = VietNamese();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final language = appProvider.language;

    loadLangue(appProvider);

    if (isAuthenticating) {
      authenticate(authProvider);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: isAuthenticating
            ? const CircularProgressIndicator()
            : isAuthenticated
                ? Container()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                              child: SizedBox(width: 250, child: Image.asset("asset/img/logo.png"))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    language.email,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                                  ),
                                ),
                                TextField(
                                  style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.all(13),
                                        child: SvgPicture.asset("asset/svg/ic_email.svg", color: Colors.grey[600]),
                                      ),
                                      border:
                                          const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                                      hintText: "abc@gmail.com"),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child:
                                      Text(language.password, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                                ),
                                TextField(
                                  style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.all(13),
                                        child: SvgPicture.asset("asset/svg/ic_password.svg", color: Colors.grey[600]),
                                      ),
                                      border:
                                          const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                                      hintText: "**************"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Text(language.signUpQuestion, style: const TextStyle(fontSize: 12)),
                                      GestureDetector(
                                          child: Text(language.signUp, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                                          onTap: () {
                                            Navigator.popAndPushNamed(context, routes.registerPage);
                                          })
                                    ],
                                  ),
                                  GestureDetector(
                                      child: Text(language.forgotPassword, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                                      onTap: () {
                                        Navigator.popAndPushNamed(context, routes.forgotPasswordPage);
                                      })
                                ],
                              )),
                          ButtonFullWidth(
                              padding: const EdgeInsets.all(8.0),
                              text: language.signIn,
                              backgroundColor: const Color(0xff007CFF),
                              onPress: () {
                                handleLogin(language, authProvider);
                              }),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(language.continueWith)]),
                          ),
                          LoginWith(callback: callback),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
