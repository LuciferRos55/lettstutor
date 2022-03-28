import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

class Component extends StatefulWidget {
  const Component({Key? key}) : super(key: key);

  @override
  _ComponentState createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TutorItemWidget(
                description:
                    'Tin tức cặp sao đang tìm hiểu nhau rộ lên từ cuối tháng 9. Tài tử Đài Loan thoải mái bày tỏ tình cảm với Hứa Vỹ Ninh, trong khi sao nữ kín tiếng.',
                name: 'Khưu Trạch',
                urlImage: 'assets/images/avatars/img_avatar1.jpg'),
            TextfieldWidget(label: 'Họ và tên'),
            SearchBarWidget(label: 'sdgs')
          ],
        ),
      ),
    ));
  }
}
