import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/global_state/navigation_index.dart';
import 'package:lettstutor/screens/setting_page/setting_btn.dart';
import 'package:lettstutor/route.dart' as routes;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final naviationIndex = Provider.of<NavigationIndex>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final userAuth = authProvider.userLoggedIn;
    final lang = Provider.of<AppProvider>(context).language;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: CachedNetworkImage(
                            imageUrl: userAuth.avatar,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          userAuth.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        userAuth.email,
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                userAuth.roles != null && userAuth.roles!.contains("CHANGE_PASSWORD")
                    ? SettingButton(
                        icon: "asset/svg/ic_password2.svg",
                        title: lang.changePassword,
                        routeName: routes.changePasswordPage,
                      )
                    : Container(),
                SettingButton(
                  icon: "asset/svg/ic_history.svg",
                  title: lang.sessionHistory,
                  routeName: routes.sessionHistoryPage,
                ),
                SettingButton(
                  icon: "asset/svg/ic_setting2.svg",
                  title: lang.advancedSetting,
                  routeName: routes.advancedSettingPage,
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          launch("https://lettutor.com/");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "asset/svg/ic_network.svg",
                                    width: 25,
                                    color: Colors.grey[700],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      lang.ourWebsite,
                                      style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_next.svg",
                                color: Colors.grey[700],
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          launch("fb://page/107781621638450");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "asset/svg/ic_facebook2.svg",
                                    width: 25,
                                    color: Colors.grey[700],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_next.svg",
                                color: Colors.grey[700],
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove("refresh_token");
                  authProvider.tokens = null;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    routes.loginPage,
                    (Route<dynamic> route) => false,
                  );
                  naviationIndex.index = 0;
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 13, bottom: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lang.logout,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff007CFF),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
