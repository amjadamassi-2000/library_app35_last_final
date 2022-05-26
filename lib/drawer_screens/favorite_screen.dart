import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/inner_screens/allCategoriesTapScreen.dart';
import 'package:library_app/inner_screens/favoriteTapScreen.dart';

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
          child: SafeArea(
            child: Scaffold(
//              backgroundColor: primaryColor,
              drawer: MyDrawer(),

              body:  Column(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.3,
                    child: LayoutBuilder(
                      builder: (ctx,constraint)=>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 2),
                                  height: constraint.maxHeight*0.2,
                                  child: Builder(
                                    builder: (BuildContext context) {
                                      return IconButton(
                                        icon: CircleAvatar(
                                          backgroundColor:
                                          Colors.grey.shade100.withOpacity(0.3),
                                          child: Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          cubit.drawerModel!=null?
                                          Scaffold.of(ctx)
                                              .openDrawer():cubit.getDrawerData().then((value) {
                                            return   Scaffold.of(ctx)
                                                .openDrawer();
                                          });
                                        },
                                        tooltip: MaterialLocalizations.of(context)
                                            .openAppDrawerTooltip,
                                      );
                                    },
                                  ),
                                ),
                                Spacer(),

                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(bottom: constraint.maxHeight*0.1),
                            child: Image.network(cubit.appModel.app.logo??'', width:  150,height: constraint.maxHeight*0.4,),
                          ),

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
                                  color:   HexColor('14144e'),        // Color(0xffea0e8b),
                                  borderRadius: BorderRadius.circular(10),
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.666,
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