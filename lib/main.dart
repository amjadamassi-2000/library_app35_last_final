import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:library_app/styles/themes.dart';

import 'drawer_screens/home_sceen.dart';



void main() {
//  MyApp(),

  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  RequestConfiguration config = RequestConfiguration(
    testDeviceIds: <String> ["E8F901B8C95DCC8C292B9D20E9454B0B"],
  );
  MobileAds.instance.updateRequestConfiguration(config);



  runApp(
 MyApp(),


  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) =>
  //       MyApp(), // Wrap your app
  // ),

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
          home: HomeScreen(),

        );
    });
  }
}
