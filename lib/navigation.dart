import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants/colors_app.dart';
import '../global_state/app_provider.dart';
import '../global_state/auth_provider.dart';
import '../global_state/navigation_index.dart';
import '../screens/courses_search_page/courses.dart';
import '../screens/home_page/home.dart';
import '../widgets/menu_item.dart';
import '../screens/setting_page/setting.dart';
import '../screens/tutors_search_page/tutors.dart';
import '../screens/upcoming_page/upcoming.dart';
import 'package:provider/provider.dart';
import 'route.dart' as routes;

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<Widget> pages = [
    const HomePage(),
    const CoursesSearchPage(),
    const UpcomingPage(),
    const TutorsPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    final navigationIndex = Provider.of<NavigationIndex>(context);
    final authUser = Provider.of<AuthProvider>(context).userLoggedIn;
    final lang = Provider.of<AppProvider>(context).language;
    List<String> titles = [lang.home, lang.course, lang.upcoming, lang.tutors, lang.setting];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text(
            titles[navigationIndex.index],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: navigationIndex.index == 0
              ? [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    routes.profilePage,
                  );
                },
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: CachedNetworkImage(
                      imageUrl: authUser.avatar,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            )
          ]
              : [],
        ),
        backgroundColor: Colors.white,
        body: pages[navigationIndex.index],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (int value) {
            navigationIndex.index = value;
          },
          elevation: 20,
          currentIndex: navigationIndex.index,
          items: [
            MenuItem(sourceIcon: "asset/svg/ic_home.svg", label: lang.home).generateItem(context),
            MenuItem(sourceIcon: "asset/svg/ic_course.svg", label: lang.course).generateItem(context),
            MenuItem(sourceIcon: "asset/svg/ic_upcoming.svg", label: lang.upcoming).generateItem(context),
            MenuItem(sourceIcon: "asset/svg/ic_tutor.svg", label: lang.tutors).generateItem(context),
            MenuItem(sourceIcon: "asset/svg/ic_setting.svg", label: lang.setting).generateItem(context),
          ],
        ),
      ),
    );
  }
}
