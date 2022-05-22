import 'package:flutter/material.dart';
import 'package:library_app/items/favorit_item.dart';
import 'package:library_app/items/myFav.dart';
import 'package:library_app/items/pdf_item.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';



class FavoriyeTapScreen extends StatefulWidget {
  @override
  _FavoriyeTapScreenState createState() => _FavoriyeTapScreenState();
}

class _FavoriyeTapScreenState extends State<FavoriyeTapScreen> {
  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return
       ListView.builder(
        itemCount: (cubit.favouritesProduct.length)!=null?cubit.favouritesProduct.length:0,
        itemBuilder: (context , index){
          return myfav(cubit.favouritesProduct[index]);
        }

    );
  }
}
