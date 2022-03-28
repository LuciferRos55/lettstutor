import 'package:flutter/material.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/widgets/core/rate_widget.dart';
import 'package:boilerplate/widgets/core/tag_widget.dart';

class TutorItemWidget extends StatelessWidget {
  const TutorItemWidget(
      {Key? key,
      required this.description,
      required this.name,
      required this.urlImage})
      : super(key: key);

  final String urlImage;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.sm_padding, vertical: Dimens.md_padding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                color: Color(0xFFCCCCCC).withOpacity(0.2),
                offset: Offset(0, 4),
                spreadRadius: 2)
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Image(
                      image: AssetImage(this.urlImage),
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: Dimens.xs_padding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.name),
                      RateWidget(rate: 4),
                      Row(
                        children: [TagWidget(text: 'Tutors')],
                      )
                    ],
                  )
                ],
              ),
              Icon(Icons.favorite_outline)
            ],
          ),
          SizedBox(
            height: Dimens.xs_padding,
          ),
          Text(this.description)
        ],
      ),
    );
  }
}
