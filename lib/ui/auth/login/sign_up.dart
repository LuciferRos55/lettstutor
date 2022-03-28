import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimens.md_padding),
            child: Column(
              children: [
                TextfieldWidget(label: 'Email'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                TextfieldWidget(label: 'Password'),
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
                ButtonWidget(text: 'Sign up'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.login),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: AppColors.colors['systemColor'],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
