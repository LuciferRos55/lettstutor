import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Dimens.sm_padding, vertical: 4),
        decoration: BoxDecoration(
            color: AppColors.colors['systemColor']!.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.colors['systemColor']),
          ),
        ),
      ),
    );
  }
}
