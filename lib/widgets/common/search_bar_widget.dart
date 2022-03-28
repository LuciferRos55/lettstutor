import 'package:flutter/material.dart';

import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import '../../constants/text_style.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Dimens.md_padding),
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                hintText: '',
                hintStyle: TextStyles.searchBar['hint'],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.colors['systemColor'] as Color),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
