import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lettstutor/global_state/app_provider.dart';
import 'package:lettstutor/global_state/navigation_index.dart';
import 'package:lettstutor/global_state/auth_provider.dart';
import 'package:lettstutor/screens/home_page/home.dart';
import 'package:lettstutor/screens/login_page/login.dart';
import 'package:provider/provider.dart';
import 'package:lettstutor/route.dart' as routes;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationIndex(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routes.controller,
        // showPerformanceOverlay: true,
        title: 'Lettstutor',
        theme: ThemeData(primarySwatch: Colors.blue, primaryColor: const Color(0xff007CFF)),
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: LoginPage(),
        ),
      ),
    );
  }
}
