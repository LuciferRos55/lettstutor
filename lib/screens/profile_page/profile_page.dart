import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '/models/user/countries.dart';
import '/provider/user_provider.dart';
import 'components/birthday.dart';
import 'components/dropdown_menu.dart';
import '/screens/profile_page/components/phone.dart';
import '/widgets/avatar_circle.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late DateTime _birthday;
  late String _phone;
  late String _country;
  late String _level;
  late String _topicToLearn;
  bool isInit = true;

  final ImagePicker _picker = ImagePicker();

  void setBirthday(DateTime birthday) {
    setState(() {
      _birthday = birthday;
    });
  }

  void setPhone(String phone) {
    setState(() {
      _phone = phone;
    });
  }

  void setCountry(String country) {
    setState(() {
      _country = country;
    });
  }

  void setLevel(String level) {
    setState(() {
      _level = level;
    });
  }

  void setTopicToLearn(String topicToLearn) {
    setState(() {
      _topicToLearn = topicToLearn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final uploadImage = userProvider.uploadImage;

    setState(() {
      if (isInit) {
        _birthday = user.birthDay;
        _phone = user.phone;
        _country = user.country;
        _level = user.level;
        _topicToLearn = user.topicToLearn;
        isInit = false;
      }
    });

    void _imgFromGallery() async {
      var pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (pickedFile != null) {
        userProvider.uploadProfileImage(File(pickedFile.path));
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        child: uploadImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.file(
                                  uploadImage,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const AvatarCircle(width: 200, height: 200, source: "asset/img/profile.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: _imgFromGallery,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 15,
                          child: SvgPicture.asset(
                            "asset/svg/ic_camera.svg",
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    user.fullName,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                BirthdayEdition(setBirthday: setBirthday, birthday: _birthday),
                PhoneEdition(changePhone: setPhone, phone: _phone),
                DropdownEdit(
                  title: "Country",
                  selectedItem: _country,
                  items: AllCountries.countries,
                  onChange: setCountry,
                ),
                DropdownEdit(
                  title: "My Level",
                  selectedItem: _level,
                  items: const ["Beginner", "Immediate", "Advanced"],
                  onChange: setLevel,
                ),
                DropdownEdit(
                  title: "Want to learn",
                  selectedItem: _topicToLearn,
                  items: const ["TOEIC", "IELTS", "TOEFL"],
                  onChange: setTopicToLearn,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_phone.isEmpty) {
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.error(message: "Phone number is invalid."),
                          showOutAnimationDuration: const Duration(milliseconds: 700),
                          displayDuration: const Duration(milliseconds: 200),
                        );
                      } else {
                        userProvider.updateBirthday(_birthday);
                        userProvider.updatePhone(_phone);
                        userProvider.updateCountry(_country);
                        userProvider.updateLevel(_level);
                        userProvider.updateTopicToLearn(_topicToLearn);
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 13, bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff007CFF),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}