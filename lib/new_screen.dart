//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/size_extension.dart';
//import 'package:library_app/components/my_drawer.dart';
//
//import 'components/custom_drop_down.dart';
//import 'components/global_componnets.dart';
// class NewScreen extends StatefulWidget {
//  @override
//  _NewScreenState createState() => _NewScreenState();
//}
//
//class _NewScreenState extends State<NewScreen> {
//
//
//  String _selectedstage;
//  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Directionality(
//      textDirection: TextDirection.rtl,
//      child: Scaffold(
//        backgroundColor: Colors.blue,
//        drawer: MyDrawer(),
//        body: Column(
//            children: [
//              SizedBox(
//             height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.2,
//
//                  child: LayoutBuilder(
//                   builder: (ctx,constraint)
//              => Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Padding(
//                          padding: EdgeInsets.only(
//                              top: constraint.maxHeight*0.05,
//
//                          ),
//                          child: Container(
//                            height: constraint.maxHeight*0.05,
//                            child: Builder(
//                              builder: (BuildContext context) {
//                                return IconButton(
//                                  icon: CircleAvatar(
//                                    backgroundColor:
//                                        Colors.grey.shade100.withOpacity(0.3),
//                                    child: Icon(
//                                      Icons.menu,
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                  onPressed: () {
//                                    Scaffold.of(context).openDrawer();
//                                  },
//                                  tooltip: MaterialLocalizations.of(context)
//                                      .openAppDrawerTooltip,
//                                );
//                              },
//                            ),
//                          ),
//                        ),
//                        // Container(
//                        //     height: constraint.maxHeight*0.8,
//                        //     child: Image.asset("assets/images/logo.png")),
//                      ],
//                    ),
//                  ),
//
//              ),
//
//              Container(
//                width: double.infinity,
//                       height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.8,
//
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(50),
//                    topRight: Radius.circular(50),
//                  ),
//                ),
//
//                child: SingleChildScrollView(
//                  child: Column(
//                    children: [
//                      Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 30.w)
//                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
//                        child:
//                        Text(
//                          "المراحل الدراسية",
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            fontSize: 16.sp,
//                            color: Colors.black,
//                            fontWeight: FontWeight.w600,
//                          ),
//                        ),
//
//
//                      ),
//
////                        myText(
////                          "المراحل الدراسية",
////                          16,
////                          FontWeight.w600,
////                        ),
//
//
//                      Padding(
//                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
//                        child: Container(
//                          decoration: BoxDecoration(
//                            color: Colors.grey.shade200,
//                            borderRadius: BorderRadius.circular(20.r),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey.withOpacity(0.3),
//                                  offset: Offset(0, 7),
//                                  blurRadius: 3.0,
//                                  spreadRadius: 0),
//                            ],
//                          ),
//                          width: double.infinity,
//                          height: 250.h,
//                          child: Padding(
//                            padding:  EdgeInsets.only(top: 5 , bottom: 13),
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              mainAxisSize: MainAxisSize.max,
//
//                              children: [
//                                Expanded(
//                                  child: ListView.builder(
//                                    itemCount: 4,
//                                    itemBuilder: (context , index){
//                                      return CustomDropDown(
//                                        stages,
//                                        onSelect: (newValue) {
//                                          _selectedstage = newValue;
//                                        },
//                                        hint: "اختر المرحلة",
//                                      );
//                                    }
//                                  ),
//                                ),
//                                Padding(
//                                  padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
//                                  child: myButton(
//                                      "عرض النتائج",
//                                          (){}
//                                  ),
//                                ),
//
//                              ],
//                            ),
//                          ),
//                        ),
//                      ),
//
//                      Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 30.w)
//                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
//                        child: Text(
//                          "أقسام اخرى",
//                          style: TextStyle(
//                            fontSize: 16.sp,
//                            color: Colors.black,
//                            fontWeight: FontWeight.w600,
//                          ),
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
//                            borderRadius: BorderRadius.circular(20.r),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey.withOpacity(0.3),
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
//
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//
//      ),
//    );
//  }
//}
