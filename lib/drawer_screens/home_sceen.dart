import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/inner_screens/result_screen.dart';

import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String _selectedstage;
  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];

//  bool _switchValue=true;



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          left: MediaQuery.of(context).size.height * 0.4),
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
                              Scaffold.of(context).openDrawer();
                            },
                            tooltip: MaterialLocalizations.of(context)
                                .openAppDrawerTooltip,
                          );
                        },
                      ),
                    ),
                    Image.asset("assets/images/logo.png"),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),

                child: SingleChildScrollView(
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
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(0, 7),
                                  blurRadius: 3.0,
                                  spreadRadius: 0),
                            ],
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

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w)
                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
                        child:  myText(
                            "أقسام آخرى",
                            15,
                            FontWeight.w600
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          width: double.infinity,
                          height: 135.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(0, 7),
                                  blurRadius: 3.0,
                                  spreadRadius: 0),
                            ],

                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),

                              CustomDropDown(
                                stages,
                                onSelect: (newValue) {
                                  _selectedstage = newValue;
                                },
                                hint: "اختر القسم",
                              ),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
                                child: myButton(
                                    "عرض النتائج",
                                        (){}
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
            ],
          ),
        ),

      ),
    );
  }
}
