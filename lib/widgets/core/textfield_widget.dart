import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/constants/text_style.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  _TextfieldWidgetState createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyles.textField['label'],
          ),
          SizedBox(
            height: Dimens.xs_padding,
          ),
          Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Dimens.md_padding),
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                hintText: '',
                hintStyle: TextStyles.searchBar['hint'],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(36),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.colors['systemColor'] as Color),
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
