import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:library_app/ads/cubit/ads_cubit.dart';
import 'package:library_app/shared/bloc_observer.dart';
import 'package:library_app/shared/remote/dio_helper.dart';
import 'package:library_app/shared/remote/local/cache_helper.dart';
import 'package:library_app/shared/shared_pref_helper.dart';
import 'package:library_app/styles/themes.dart';
import 'package:no_internet_check/internet_connectivity/navigation_Service.dart';

import 'components/constant.dart';
import 'drawer_screens/home_screen/cubit/home_cubit.dart';
import 'drawer_screens/home_screen/home_sceen.dart';
import 'inner_screens/search_cubit/cubit.dart';
import 'inner_screens/splash.dart';
import 'inner_screens/theme_cubit/cubit.dart';
import 'inner_screens/theme_cubit/state.dart';



void main() {
//  MyApp(),
  DioHelper.dioInit();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();

  BlocOverrides.runZoned(
        () async{
          await CacheHelper.init();
          bool isDark = CacheHelper.getBoolean(key: 'isDark');
      runApp( MyApp(isDark));
    },
    blocObserver: SimpleBlocObserver(),
  );


}

class MyApp extends StatefulWidget {

final isDark;

   MyApp( this.isDark) ;






  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

// FlutterNativeSplash.remove();

  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return ScreenUtilInit(builder: () {
      return
        MultiBlocProvider(
            child: BlocConsumer<ThemeCubit,ThemeStates>(
              listener: (context,state){},
              builder: (context,state)=>
              MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,


          themeMode: ThemeCubit.get(context).isDark
              ? ThemeMode.dark

                :ThemeMode.light,
                navigatorKey: NavigationService.navigationKey,


                home: SplashScreen(),

              ),
            ),
            providers: [
              BlocProvider(
                create: (BuildContext context) => LibraryCubit()..getAppData()..getHomeData()..getSection(id: 0)..getsubSection(id: 0)..getDrawerData()..getAllSection()..getAdsData()..userResult(),

              ),
              BlocProvider(
                create: (BuildContext context) => SearchCubit()..getSearch()

              ),
              BlocProvider(
                  create: (BuildContext context) => ThemeCubit()..changeAppMode(fromShared: widget.isDark)

              ),
            ]

        );
    });
  }
}














