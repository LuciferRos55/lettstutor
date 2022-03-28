import 'package:boilerplate/constants/dimens.dart';
import 'package:flutter/material.dart';

class ProfileActionWidget extends StatelessWidget {
  const ProfileActionWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.md_padding, vertical: Dimens.sm_padding),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8C8C8C)),
          borderRadius: BorderRadius.circular(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(
                width: Dimens.xs_padding,
              ),
              Text(this.title)
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
          )
        ],
      ),
    );
  }
}
