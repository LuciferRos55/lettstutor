import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/constants/text_style.dart';

class TextAreaWidget extends StatefulWidget {
  const TextAreaWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  _TextAreaWidgetState createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
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
          TextFormField(
            maxLines: 8,
            minLines: 8,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              filled: true,
              fillColor: Color(0xFFFFFFFF),
              hintText: '',
              hintStyle: TextStyles.searchBar['hint'],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.colors['systemColor'] as Color),
                borderRadius: BorderRadius.circular(6),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
