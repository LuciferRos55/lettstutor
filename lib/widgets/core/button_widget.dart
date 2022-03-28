import 'package:flutter/material.dart';
import 'package:boilerplate/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.text, this.height = 50, this.disable = false})
      : super(key: key);

  final String text;
  final double height;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
          color:
              this.disable ? Colors.grey[400] : AppColors.colors['systemColor'],
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14),
        ),
      ),
    );
  }
}
