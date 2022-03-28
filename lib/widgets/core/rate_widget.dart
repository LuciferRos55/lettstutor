import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({Key? key, required this.rate}) : super(key: key);

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: _renderRateWidget(rate)),
    );
  }

  List<Widget> _renderRateWidget(int rate) {
    List<Widget> result = [];

    for (int i = 0; i < 5; i++) {
      result.add(Icon(
        Icons.star,
        size: 18,
        color: i + 1 <= rate ? Color(0xFFFAAD14) : Color(0xFFCCCCCC),
      ));
    }

    return result;
  }
}
