import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/drawer_screens/favorite_screen.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../models/all_Section.dart';

import 'package:shared_preferences/shared_preferences.dart';



class FavoriteItem extends StatefulWidget {
  final Sections sections;

   FavoriteItem( this.sections) ;

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool isFavorite=false;
 // SharedPreferences prf=SharedPreferences.getInstance() as SharedPreferences;

  @override
  Widget build(BuildContext context) {
    SharedPreferences  prefs =  SharedPreferences.getInstance() as SharedPreferences;

    LibraryCubit cubit = LibraryCubit.get(context);

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w).add(EdgeInsets.only(top: 8.h , bottom: 2)),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 7),
                blurRadius: 5.0,
                spreadRadius: 0),
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(5, 0),
                blurRadius:3.0,
                spreadRadius: 0),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myText(
                "${widget.sections.name}",
                13,
                FontWeight.w600,
              ),

              IconButton(
                icon: Icon(isFavorite?Icons.favorite:Icons.favorite , size: 30, color: isFavorite?Colors.red:Colors.grey, ),
                onPressed: (){
                  cubit.toggleFavorite(widget.sections.id);

                  setState(() async{
  isFavorite=(!isFavorite);
cubit.favoriteSection.add( Sections(id: widget.sections.id,name: widget.sections.name));
  await prefs.setString('section',jsonEncode(  cubit.favoriteSection
  ) );

});
print(prefs.get('section'));

                  // setState(() {
                  //   isFavorite = (!isFavorite);
                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
