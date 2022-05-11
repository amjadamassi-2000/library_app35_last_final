import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:library_app/styles/themes.dart';
import 'package:library_app/test_screen.dart';

import 'drawer_screens/home_sceen.dart';
import 'new_screen.dart';

void main() {
//  MyApp(),
  runApp(
  MyApp(),
//    DevicePreview(
//      enabled: !kReleaseMode,
//      builder: (context) =>
//          MyApp(), // Wrap your app
//    ),
  );
}

class MyApp extends StatefulWidget {



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return
      MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:  ThemeMode.light,
        home: TestScreen(),

      );
    });
  }
}
