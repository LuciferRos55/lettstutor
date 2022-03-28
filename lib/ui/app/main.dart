import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/tutors/tutors.dart';
import 'package:boilerplate/ui/chat/chat.dart';
import 'package:boilerplate/ui/profile/profile.dart';

class NavigationItem {
  int id;
  IconData icon;
  String label;

  NavigationItem({required this.icon, required this.id, required this.label});
}

List<NavigationItem> menu = [
  NavigationItem(icon: Icons.home, label: 'Home', id: 0),
  NavigationItem(icon: Icons.messenger, label: 'Message', id: 1),
  NavigationItem(icon: Icons.notifications, label: 'Upcoming', id: 2),
  NavigationItem(icon: Icons.person, label: 'Tutor', id: 3),
  NavigationItem(icon: Icons.settings, label: 'Settings', id: 4),
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController(initialPage: 0);

  int tabActive = 0;

  void goNavigation(int page) {
    controller.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 76,
              child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (page) => {
                        setState(() {
                          tabActive = page;
                        })
                      },
                  children: [
                    HomeScreen(),
                    ChatScreen(),
                    HomeScreen(),
                    TutorsScreen(),
                    ProfileScreen(),
                  ])),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color(0xFF8C8C8C).withOpacity(0.1),
                    offset: Offset(0, -4),
                  )
                ]),
                child: Row(children: renderNavigation(menu)),
              ))
        ]),
      ),
    );
  }

  List<Widget> renderNavigation(List<NavigationItem> data) {
    List<Widget> result = [];

    for (var i = 0; i < data.length; i++) {
      result.add(InkWell(
          onTap: () => goNavigation(i),
          child: Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  data[i].icon,
                  size: 24,
                  color: data[i].id == tabActive
                      ? AppColors.colors['systemColor']
                      : Color(0xFF8C8C8C),
                ),
                Text(
                  data[i].label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: data[i].id == tabActive
                        ? FontWeight.w800
                        : FontWeight.w800,
                    color: data[i].id == tabActive
                        ? AppColors.colors['systemColor']
                        : Color(0xFF8C8C8C),
                  ),
                )
              ],
            ),
          )));
    }

    return result;
  }
}
