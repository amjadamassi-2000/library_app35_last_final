import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/inner_screens/allCategoriesTapScreen.dart';
import 'package:library_app/inner_screens/favoriteTapScreen.dart';
import 'package:library_app/shared/remote/local/cache_helper.dart';

import 'home_screen/cubit/home_cubit.dart';



class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}




class _FavoriteScreenState extends State<FavoriteScreen> {




  DateTime currentBackPressTime;


  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
//              backgroundColor: primaryColor,
            drawer: MyDrawer(),

            body:  SafeArea(
              child: Column(
                children: [


                  Container(
                    height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) * 0.24,
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Container(
                              height: constraint.maxHeight * 0.50,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            child: IconButton(
                                              icon: CircleAvatar(
                                                backgroundColor: Colors
                                                    .grey.shade100
                                                    .withOpacity(0.3),
                                                child: Icon(
                                                  Icons.menu,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onPressed: () {
                                                cubit.drawerModel != null
                                                    ? Scaffold.of(ctx)
                                                    .openDrawer()
                                                    : cubit
                                                    .getDrawerData()
                                                    .then((value) {
                                                  return Scaffold.of(
                                                      ctx)
                                                      .openDrawer();
                                                });
                                              },
                                              tooltip:
                                              MaterialLocalizations.of(
                                                  context)
                                                  .openAppDrawerTooltip,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: constraint.maxHeight * 0.05),
                                    child: Image.network(
                                      cubit.appModel.app.logo,
                                      width: 170,
                                      height: constraint.maxHeight * 0.50,
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),

                            //============LOGO============================

                            //============SEARCH============================

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                height: constraint.maxHeight*0.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                    color:   CacheHelper.getBoolean(key: 'isDark')? HexColor('14144e') :Color(0xffea0e8b) ,
                                    borderRadius: BorderRadius.circular(10),  //Color(0xffea0e8b)
                                  ),
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "المفضلة",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "cairo",

                                        ),
                                      ),
                                    ),

                                    Tab(
                                      child: Text(
                                        "كل الأقسام",
                                        style:TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "cairo",
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.725,
                    decoration: BoxDecoration(
                      color:Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 20,),

                        Expanded(
                          child: TabBarView(
                            children: [
                              FavoriyeTapScreen(),
                              AllCategoriesTapScreen(),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),



          ),
        ),
    );
  }
}























/*
Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 200,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                       tabs: [
                         Tab(text: "المفضلة",),
                         Tab(text: "كل الأقسام",),
                       ],

                    ),
                  ),
                ),

                SizedBox(height: 0,),

                Expanded(
                  child: TabBarView(
                    children: [
                      FavoriyeTapScreen(),
                      AllCategoriesTapScreen(),

                    ],
                  ),
                ),


              ],
            ),
 */