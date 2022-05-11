import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/drawer_screens/favorite_screen.dart';

import 'global_componnets.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          myListTiel(
            "الرئيسية",
            Icon(Icons.home_outlined, color: Colors.black),
            () {
              //To(context , OrdersScreen());
            },
          ),
          myListTiel(
            "المفضلة",
            Icon(Icons.favorite, color: Colors.black),
            () {
              To(context, FavoriteScreen());
            },
          ),
        ],
      ),
    );
  }
}
