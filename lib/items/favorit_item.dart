import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/components/global_componnets.dart';




class FavoriteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                "الصف الأول الإبتدائي الترم الأول",
                13,
                FontWeight.w600
              ),

              IconButton(
                icon: Icon(Icons.favorite , size: 30, ),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
