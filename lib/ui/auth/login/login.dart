import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 80),
                child: Padding(
                    padding: EdgeInsets.all(Dimens.md_padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          height: 120,
                        ),
                        Text(
                          'Lettutor',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            color: AppColors.colors['systemColor'],
                          ),
                        ),
                        SizedBox(
                          height: Dimens.md_padding,
                        ),
                        TextfieldWidget(label: 'Email'),
                        SizedBox(
                          height: Dimens.md_padding,
                        ),
                        TextfieldWidget(label: 'Password'),
                        SizedBox(
                          height: Dimens.md_padding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(Routes.forgotPassword),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: AppColors.colors['systemColor'],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimens.md_padding,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed(Routes.main),
                          child: ButtonWidget(text: 'Login'),
                        ),
                        SizedBox(
                          height: Dimens.md_padding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account?'),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(Routes.signUp),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: AppColors.colors['systemColor'],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            )));
  }
}
