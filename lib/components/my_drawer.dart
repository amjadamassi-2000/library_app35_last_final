import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/drawer_screens/favorite_screen.dart';
import 'package:library_app/drawer_screens/home_screen/home_sceen.dart';
import 'package:library_app/drawer_screens/settings_screen.dart';
import 'package:library_app/inner_screens/search_screen.dart';
import 'package:library_app/inner_screens/theme_cubit/cubit.dart';
import 'package:library_app/inner_screens/theme_cubit/state.dart';
import 'package:library_app/shared/remote/local/cache_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import '../shared/shared_pref_helper.dart';
import 'global_componnets.dart';







class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {



  List <String> titles =[
    "حسابنا على تويتر",
    "حسابنا على فيسبوك",
    "قييم التطبيق"
  ];

  List <Widget> icons = [

   // SvgPicture.asset("assets/images/twitter_white.svg" ,),
    Image.network("https://www.iconsdb.com/icons/preview/white/twitter-xxl.png" , width: 25,),
    Icon(Icons.facebook, color: Colors.white),
    SvgPicture.asset("assets/images/google-play.svg" ,),

  ];





  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    bool _switchValue=CacheHelper.getBoolean(key: 'isDark');

    return BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {

    },
    builder: (context, state) =>

    Container(

      child: Drawer(

        child: Container(
          color : Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(

             children: [

               SizedBox(
                 height: 100.h,
               ),
               Image.network(cubit.appModel.app.logo, width:  150,),
               SizedBox(
                 height: 15.h,
               ),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Icon(Icons.brightness_4, color: Colors.white),
                     SizedBox(
                       width: 15.h,
                     ),
                     Text(
                       'الوضع المظلم',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w500,
                         fontFamily: 'cairo',

                       ),
                     ),
                    Spacer(),
                     CupertinoSwitch(

                       value: _switchValue,
                       onChanged: (value) {
                         setState(() {
                           ThemeCubit.get(context).changeAppMode(fromShared: value);

                           _switchValue = value;
                           print(CacheHelper.getBoolean(key: 'isDark'));
                         });
                       },
                       trackColor: Colors.grey.shade200.withOpacity(0.2),
                     ),


                   ],
                 ),
               ),
                myListTielStatic(
          "الرئيسية",
          Icon(Icons.home, color: Colors.white),
              () async{
            await cubit.getHomeData().then((value) async{
              return  await ToAndFinish(context, HomeScreen());
            });


          },
        ),

          //

            myListTielStatic(
              "المفضلة",
              Icon(Icons.favorite, color: Colors.white),
                  () async{
                    Navigator.pop(context);

                 await   SharedPrefHelper.sharedPrefHelper.initSharedPrefs();
                  cubit.getAllFavouriteProducts();
                    To(context, FavoriteScreen()

                    );

              },
            ),




                 Padding(
                   padding:  EdgeInsets.only(bottom: 0),
                   child: ListView.builder(
                     padding: EdgeInsets.zero,

                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: cubit.drawerModel.data.length ,
                     // ignore: missing_return
                     itemBuilder: (context, index){
                       return  myListTiel(cubit.drawerModel.data[index].name,'${cubit.drawerModel.data[index].icon}', () async {
                         final url = cubit.drawerModel.data[index].link;
                         if (await canLaunch(url)) {
                           await launch(url);
                         } else {
                           throw 'Could not launch $url';
                         }
                       },);
                       // if(index == 0) {

                       // }else if(index == 1){
                       //  return
                       // } else if(index == 2){

                       // } else if ( index == 3){

                       // } else {
                       //   return
                       //
                       // }



//                           myListTiel(
//                            "حسابنا على تويتر",
// //                           icons[index],
//                             // SvgPicture.asset("assets/images/twitter_white.svg" , width: 22,),
//                           Image.network("https://www.iconsdb.com/icons/preview/white/twitter-xxl.png" , width: 23,),
//
//                                  () async {
//                                    const url = 'https://www.facebook.com/amjad.abed.948';
//                                    if (await canLaunch(url)) {
//                                      await launch(url);
//                                    } else {
//                                      throw 'Could not launch $url';
//                                    }
//                                  },
//
//                          );




                     }

               ),
                 ),


             ],
                  ),
          ),
        ),
      ),
    ));
  }
}
