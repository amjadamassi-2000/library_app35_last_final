import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_app/ads/banner_ad_model.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_app_banner.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/drawer_screens/home_screen/cubit/home_cubit.dart';
import 'package:library_app/dummy_data/home_screen_data.dart';
import 'package:library_app/inner_screens/result_screen.dart';
import 'package:library_app/items/home_screen_item.dart';

import '../../ads/interstitial_ad_model.dart';
import 'cubit/home_state.dart';

//import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _selectedstage;

//  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];

//  bool _switchValue=true;

//   final snackBar = SnackBar(
//    content: Text(
//        'اضغط مرة اخرى للخروج',
//      style:TextStyle(
//        fontSize: 14,
//        fontFamily: "cairo",
//      ),
//
//    ),
//  );

  DateTime currentBackPressTime;


  Future<bool> showExitPopup(context) async{
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 120.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),

                  myText('هل تريد الخروج ؟', 15, FontWeight.bold),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(0);
                          },
                          child: myText("نعم",22,FontWeight.normal),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade800),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('no selected');
                              Navigator.of(context).pop();
                            },
                            child: Text("لا", style: TextStyle(color: Colors.black,fontFamily: 'cairo',fontSize: 22)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,

                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Adinterstitial.showInterstitialAd();

  }



  @override
  Widget build(BuildContext context) {





    return BlocConsumer<LibraryCubit, libraryStates>(
        listener: (context, state) {},
        builder: (context, state)  {
          LibraryCubit cubit = LibraryCubit.get(context);

          //
          // Future.delayed(Duration(seconds: 5),() {
          //
          //
          // });

          return

            cubit.homeModel!=null&&cubit.appModel!=null&&cubit.adsModel!=null
              ?
            Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
//                    backgroundColor: primaryColor,
                    drawer: MyDrawer(),


                    body: WillPopScope(

                      child: SafeArea(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: (MediaQuery.of(context).size.height -
                                          MediaQuery.of(context).padding.top) *
                                      0.25,
                                  child: LayoutBuilder(
                                    builder: (ctx, constraint) => Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: constraint.maxHeight * 0.3,
                                          child: Row(
                                            children: [
                                              Builder(
                                                builder: (BuildContext ctx) {
                                                  return IconButton(
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
                                                      cubit.drawerModel!=null?
                                                      Scaffold.of(ctx)
                                                          .openDrawer():cubit.getDrawerData().then((value) {
                                                            return   Scaffold.of(ctx)
                                                                .openDrawer();
                                                          });
                                                    },
                                                    tooltip:
                                                        MaterialLocalizations.of(
                                                                context)
                                                            .openAppDrawerTooltip,
                                                  );
                                                },
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        Image.network(
                                          '${cubit.appModel.app.logo}'??'',
                                          width: 170,
                                          height: constraint.maxHeight * 0.7,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: (MediaQuery.of(context).size.height -
                                          MediaQuery.of(context).padding.top) *
                                      0.75,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        MyAppBanner(
                                          cubit.appModel.app.homepageLink??'',
                                        cubit.appModel.app.homepageBanner!=null?          ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          child: Image.network(
                                            cubit.appModel.app.homepageBanner??[],
                                            width: 400,
                                            height: 70,
                                            fit:BoxFit.fitWidth,
                                          ),
                                        ):

                                      myText(
                                      cubit.appModel.app.homepageLink??'',
                                        14,
                                        FontWeight.w400,
                                      ),

                                        ),

                                        Scrollbar(
                                          thickness: 5,
                                          radius: Radius.circular(50),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                    top: 30, bottom: 35)
                                                .add(EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                            child: ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,

                                                itemCount:
                                                    cubit.homeModel.titles.length,
                                                itemBuilder: (context, index) {
                                                  return HomeScreenItem(
                                                      cubit.homeModel
                                                          .titles[index],
                                                      cubit.sectionModel,
                                                      cubit.subsectionModel,cubit.adsModel);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: AdBanner2(cubit.adsModel.ads.banner),
                            ),

//              Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Spacer(),
//                  AdBanner2(),
//
////                Container(
////                  alignment: Alignment.center,
////                  color: Colors.red,
////                  height: 60,
////                  width: double.infinity,
////                  child: Text("hhhhhhhhhhhhh"),
////                ),
//                ],
//              ),
                          ],
                        ),
                      ),
                      onWillPop:()=>showExitPopup(context),

                    ),
                  ))
              : Scaffold(
                  body:buildSearchLoadingIndicator());

        });
  }
}

/*
SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w)
                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
                        child:
                        myText(
                            "المراحل الدراسية",
                            15,
                            FontWeight.w600
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          width: double.infinity,
                          height: 250.h,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 5 , bottom: 13),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: 2,
                                      itemBuilder: (context , index){
                                        return CustomDropDown(
                                          stages,
                                          onSelect: (newValue) {
                                            _selectedstage = newValue;
                                          },
                                          hint: "اختر المرحلة",
                                        );
                                      }
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
                                  child: myButton(
                                      "عرض النتائج",
                                          (){
                                        To(context , ResultScreen());
                                          }
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      Divider(
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,

                      ),



//                      Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 30.w)
//                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
//                        child:  myText(
//                            "أقسام آخرى",
//                            15,
//                            FontWeight.w600
//                        ),
//                      ),
//
//                      Padding(
//                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
//                        child: Container(
//                          width: double.infinity,
//                          height: 135.h,
//                          decoration: BoxDecoration(
//                            color: Colors.grey.shade200,
//                            borderRadius: BorderRadius.circular(10.r),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey.shade100.withOpacity(0.9),
//                                  offset: Offset(0, 7),
//                                  blurRadius: 3.0,
//                                  spreadRadius: 0),
//                            ],
//
//                          ),
//                          child: Column(
//                            children: [
//                              SizedBox(height: 10,),
//
//                              CustomDropDown(
//                                stages,
//                                onSelect: (newValue) {
//                                  _selectedstage = newValue;
//                                },
//                                hint: "اختر القسم",
//                              ),
//
//                              Padding(
//                                padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
//                                child: myButton(
//                                    "عرض النتائج",
//                                        (){}
//                                ),
//                              ),
//
//                            ],
//                          ),
//                        ),
//                      ),

                    ],
                  ),
                ),
 */
