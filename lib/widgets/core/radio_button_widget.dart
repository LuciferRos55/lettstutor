import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget(
      {Key? key, required this.selected, required this.text})
      : super(key: key);

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: (selected
                      ? AppColors.colors['systemColor']
                      : AppColors.colors['textColor3']) as Color)),
          child: Center(
            child: selected
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colors['systemColor']),
                  )
                : SizedBox(),
          ),
        ),
        SizedBox(
          width: Dimens.sm_padding,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.colors['textColor2']),
          ),
        )
      ],
    );
  }
}
