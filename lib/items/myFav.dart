import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/global_componnets.dart';
import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../inner_screens/result_screen.dart';
import '../models/all_Section.dart';
import '../shared/shared_pref_helper.dart';
class myfav extends StatefulWidget {
  final Sections sections;

   myfav( this.sections) ;

  @override
  State<myfav> createState() => _myfavState();
}

class _myfavState extends State<myfav> {
  bool isFavorite=true;

  @override
  Widget build(BuildContext context) {

    LibraryCubit cubit = LibraryCubit.get(context);

    return InkWell(
      onTap: (){
        print(widget.sections);
        cubit.userResult(section_id: widget.sections.id).then((value) {
          print(widget.sections.id);
          print('هدا ايدي المفضلة ');

          return   To(context , ResultScreen(myvalue1: widget.sections.id,));

        });
      },
      child: Padding(
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
                  FontWeight.w400,
                ),

                IconButton(
                  icon: Icon(isFavorite?Icons.favorite:Icons.favorite , size: 30, color: isFavorite?Colors.red:Colors.grey, ),
                  onPressed: ()async{
                    await SharedPrefHelper.sharedPrefHelper.initSharedPrefs();

                    setState(() {
                     cubit.onPressedFavouriteButton(widget.sections.id);
                      isFavorite=(!isFavorite);

                    });
                    print('تم بنجاح');
                    cubit.favouritesProduct.forEach((element) {print(element.name);});
                    // print(cubit.favouritesProduct[0].name.toString());
                    //sharedPrefHelper.isProductInFavourite(widget.sections.id)

                    // setState(() {
                    //
                    //   //    await cubit.toggleFavorite(widget.sections.id);
                    //
                    //   //print('asdasdasdasdasdasdasdaasdadasdasd');
                    //   //
                    //   // isFavorite=(!isFavorite);
                    //   // cubit.favoriteSection.add( Sections(id: widget.sections.id,name: widget.sections.name));
                    //
                    //   //await prefs.setString('section',jsonEncode(  cubit.favoriteSection
                    //   // ) );
                    //
                    // });
//print(prefs.get('section'));

                    // setState(() {
                    //   isFavorite = (!isFavorite);
                    // });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
