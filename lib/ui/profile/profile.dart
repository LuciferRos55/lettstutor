import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/common/profile_action_widget.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 80),
          child: Padding(
            padding: EdgeInsets.all(Dimens.md_padding),
            child: Column(
              children: [
                _renderUser(),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ProfileActionWidget(
                    icon: Icons.person, title: 'View Feedbacks'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ProfileActionWidget(
                    icon: Icons.list_alt, title: 'Booking History'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ProfileActionWidget(
                    icon: Icons.history, title: 'Session History'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ProfileActionWidget(
                    icon: Icons.settings, title: 'Advanced Setting'),
                SizedBox(
                  height: Dimens.lg_padding,
                ),
                ProfileActionWidget(icon: Icons.language, title: 'Our Website'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ProfileActionWidget(icon: Icons.facebook, title: 'Facebook'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                ButtonWidget(text: 'Sign out')
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _renderUser() {
    return Row(
      children: [
        Icon(Icons.person_pin, size: 72,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nguyễn Văn A'),
            SizedBox(height: Dimens.xs_padding,),
            Text('nguyenvana@gmail.com'),
          ],
        )
      ],
    );
  }
}
