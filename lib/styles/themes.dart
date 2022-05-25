
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'styles.dart';
import 'colors.dart';




ThemeData darkTheme = ThemeData(
  primarySwatch: primaryColor,

  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: HexColor('333739'), statusBarIconBrightness: Brightness.light),
    backwardsCompatibility: false,
    backgroundColor: HexColor('333739'),
    elevation: 1.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      elevation: 10.0,
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey
  ),
  bottomAppBarTheme: BottomAppBarTheme(
      color: HexColor('333739'),
      shape: CircularNotchedRectangle(),
      elevation: 3.0
  ),
  textTheme: TextTheme(
//    caption: TextStyle(color: Colors.white60),

    bodyText1: TextStyle(
      // fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.white
    ),



    bodyText2: TextStyle(
      // fontSize: 18,
//        fontWeight: FontWeight.bold,
        color: Colors.white
    ),

  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),


  ),
  iconTheme: IconThemeData(color:Colors.white60 ),






  indicatorColor: Colors.white,
  scaffoldBackgroundColor: HexColor('1f2030'),   //000000   //1f2030s
  cardColor: HexColor('252a34'),                //404040      //2b3456
  secondaryHeaderColor: HexColor('2b3456'),     //272727
  canvasColor: HexColor('252a34'),

  // border
  disabledColor: HexColor('252a34'),

) ;












ThemeData lightTheme = ThemeData(
  primarySwatch: primaryColor,

  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
    ),
    backwardsCompatibility: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    elevation: 10.0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  textTheme: TextTheme(
    headline5: bigTitles.headline5,
    bodyText2: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87
    ),
    bodyText1: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black87
    ),
    caption: TextStyle(color: Colors.black54),

  ),





  fontFamily: 'cairo' ,
  cardColor: Colors.white,
  secondaryHeaderColor: Colors.white,
  indicatorColor: Colors.black,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: HexColor('3333cc'),

  // border
  disabledColor: Colors.grey.shade300,




);