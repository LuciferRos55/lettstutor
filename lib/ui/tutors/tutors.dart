import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/core/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/widgets/common/tutor_item_widget.dart';
import 'package:boilerplate/widgets/core/textfield_widget.dart';
import 'package:boilerplate/widgets/common/search_bar_widget.dart';

class TutorsScreen extends StatefulWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  _TutorsScreenState createState() => _TutorsScreenState();
}

class _TutorsScreenState extends State<TutorsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Tutor',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 80),
          child: Padding(
            padding: EdgeInsets.all(Dimens.md_padding),
            child: Column(
              children: [
                SearchBarWidget(label: 'sdgs'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                TutorItemWidget(
                    description:
                        'Tin tức cặp sao đang tìm hiểu nhau rộ lên từ cuối tháng 9. Tài tử Đài Loan thoải mái bày tỏ tình cảm với Hứa Vỹ Ninh, trong khi sao nữ kín tiếng.',
                    name: 'Khưu Trạch',
                    urlImage: 'assets/images/avatars/img_avatar1.jpg'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                TutorItemWidget(
                    description:
                        'Tin tức cặp sao đang tìm hiểu nhau rộ lên từ cuối tháng 9. Tài tử Đài Loan thoải mái bày tỏ tình cảm với Hứa Vỹ Ninh, trong khi sao nữ kín tiếng.',
                    name: 'Khưu Trạch',
                    urlImage: 'assets/images/avatars/img_avatar1.jpg'),
                SizedBox(
                  height: Dimens.md_padding,
                ),
                TutorItemWidget(
                    description:
                        'Tin tức cặp sao đang tìm hiểu nhau rộ lên từ cuối tháng 9. Tài tử Đài Loan thoải mái bày tỏ tình cảm với Hứa Vỹ Ninh, trong khi sao nữ kín tiếng.',
                    name: 'Khưu Trạch',
                    urlImage: 'assets/images/avatars/img_avatar1.jpg'),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
