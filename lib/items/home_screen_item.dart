import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/ads/interstitial_ad_model.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_dropdown.dart';
import 'package:library_app/dummy_data/home_screen_data.dart';
import 'package:library_app/inner_screens/result_screen.dart';
import 'package:library_app/models/ads_model.dart';
import 'package:library_app/models/sub_sectionModel.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import '../models/home_model.dart';
import '../models/section_model.dart';

class HomeScreenItem extends StatefulWidget {
  final Titles titles;
  final SectionModel sectionModel;
  final SubSectionModel subsectionModel;
final AdsModel adsModel;
  HomeScreenItem(this.titles, this.sectionModel, this.subsectionModel, this.adsModel);

  //  final HomeData homeData;
  // HomeScreenItem(this.homeData);

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  String _selectedstage;

  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];
  int myvalue1;
  int myvalue2;
  int myvalue3;
  int myvalue4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Adinterstitial.loadInterstitialAd(widget.adsModel.ads.inter1);

  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return widget.subsectionModel != null &&
            widget.titles != null &&
            cubit.sectionModel != null &&
            cubit.subsectionModel != null &&
            cubit.homeModel != null
        ? Column(
            children: [
              // SizedBox(height: 200,),
              if (widget.titles.section.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: myText(
                        widget.titles.name,
                        15,
                        FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),

//        SizedBox(height: 10.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: 100.0,
                    maxHeight: 430.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Scrollbar(
                      radius: Radius.circular(50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (widget.titles.section.isNotEmpty)
                              my_dropdown(widget.titles.section,
                                  myvalue1,
                                  hint: (widget.titles.name=='المراحل الدراسية'?"اختر الصف":'اختر القسم')??'اختر',
                                  MychangeMethod: (val) {
                         print(widget.titles.section.first.name);
                         print('هدا العنصر الاول ');
                         print(val);
                        if(widget.titles.section.first!=null){print('123');}

                                setState(() {
                                  myvalue1 = val;
                                  widget.sectionModel.sub = [];
                                  widget.subsectionModel.sub = [];
                                  myvalue2 = null;
                                  myvalue3 = null;

                                  print(
                                      '${widget.sectionModel.sub.isEmpty} فارغةةةةةةة');
                                  cubit.getSection(id: val);
                                  print(cubit.sectionModel.sub.isEmpty);
                                  print(val.toString());
                                  print(cubit.subsectionModel.status);
                                });
                              }),

                            if (widget.titles.subSection.isNotEmpty)
                              my_dropdown(widget.sectionModel.sub,
                                  myvalue2,
                                  hint:(widget.titles.name=='المراحل الدراسية'?"اختر الترم":'اختر النوع')?? "اختر ",

                                  MychangeMethod: (val) {
                                setState(() {
                                  myvalue3 = null;
                                  widget.subsectionModel.sub = [];
                                  print(myvalue2);
                                  cubit.getsubSection(id: val);
                                  myvalue2 = val;
                                  print(val.toString());
                                });
                              }),
                            if (widget.titles.subSubSection.isNotEmpty)
                              my_dropdown(widget.subsectionModel.sub,
                                  myvalue3,
                                  hint: "اختر المادة",

                                  MychangeMethod: (val) {
                                setState(() {
                                  myvalue3 = val;
                                });
                              }),

                            if (widget.titles.categories.isNotEmpty)
                              my_dropdown(widget.titles.categories,
                                  myvalue4,
                                  hint: "اختر نوع الملف",
                                  MychangeMethod: (val) {
                                setState(() {
                                  myvalue4 = val;
                                });
                              }),

                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 20),
                            //
                            //   child: Container(
                            //     height: MediaQuery.of(context).size.height * 0.08,
                            //     alignment: Alignment.center,
                            //     padding: EdgeInsets.symmetric(horizontal: 10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(15),
                            //       color: Colors.white,
                            //       border: Border.all(
                            //         width: 2,
                            //         color: Colors.grey.shade300,
                            //       ),
                            //     ),
                            //
                            //     child: DropdownButton(
                            //       isExpanded: true,
                            //
                            //       value: myvalue,
                            //       onChanged: (value){
                            //         setState(() {
                            //           myvalue=value;
                            //         });
                            //
                            //       },
                            //       items:widget.titles.section.map((e) => DropdownMenuItem(value: e.name,child: Text(e.name))).toList() ,
                            //     ),
                            //   ),
                            // ),

                            //
                            //  CustomDropDown(widget.titles.subSection ,onSelect: (){},),
                            //
                            // if(widget.titles.subSubSection .isNotEmpty)
                            //  CustomDropDown(widget.titles.subSubSection,onSelect: (){},),

                            // ListView.builder(
                            //   physics: NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     itemCount: widget.titles.section.length,
                            //     itemBuilder: (context, index) {
                            //       return CustomDropDown();
                            //     }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              if (widget.titles.section.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30)
                      .add(EdgeInsets.only(top: 0)),
                  child: myButton("عرض النتائج", () async{
                    Adinterstitial.showInterstitialAd();

                   await   cubit
                        .userResult(

                            section_id: myvalue1,
                            sub_section_id: myvalue2,
                            sub_sub_section_id: myvalue3,
                            categories: myvalue4,
                            title_id: widget.titles.id)
                        .then((value) {
                     // print({cubit.resultModel.files.length});
                      print("هداا طول المصفوفة ");
                      return To(
                          context,
                          ResultScreen(myvalue1: myvalue1,myvalue2:  myvalue2,myvalue3:  myvalue3,myvalue4:  myvalue4,
                             titles:  widget.titles,));
                    }
                    );

                  }),
                ),
              SizedBox(
                height: 20,
              ),

//        Divider(
//          color: Colors.grey,
//          indent: 30,
//          endIndent: 30,
//        ),
            ],
          )
        : Center(child: buildSearchLoadingIndicator());
  }
}
