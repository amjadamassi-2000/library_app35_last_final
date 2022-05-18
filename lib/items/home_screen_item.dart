import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/ads/interstitial_ad_model.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_dropdown.dart';
import 'package:library_app/dummy_data/home_screen_data.dart';
import 'package:library_app/inner_screens/result_screen.dart';

import '../models/home_model.dart';

class HomeScreenItem extends StatefulWidget {
final   Titles titles;

   HomeScreenItem( this.titles) ;

  //  final HomeData homeData;
  // HomeScreenItem(this.homeData);

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  String _selectedstage;

  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];
  String myvalue1;
  String myvalue2;
  String myvalue3;
  String myvalue4;
  String myvalue5;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Adinterstitial.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

       // SizedBox(height: 200,),

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
                FontWeight.w600,
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
              maxHeight: 300.0,
            ),

            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding:  EdgeInsets.only(bottom: 20 , top: 20),
              child: Scrollbar(
                radius: Radius.circular(50),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      if (widget.titles.section .isNotEmpty)
                        my_dropdown(widget.titles.section,myvalue1),

                      if (widget.titles.subSection .isNotEmpty)
                        my_dropdown(widget.titles.subSection,myvalue2),
                      if (widget.titles.subSubSection .isNotEmpty)
                        my_dropdown(widget.titles.subSubSection,myvalue3),


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
        SizedBox(height: 30,),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30)
              .add(EdgeInsets.only(top:0)),
          child: myButton("عرض النتائج", () {


            Adinterstitial.showInterstitialAd();

            To(context ,ResultScreen() );


          }),
        ),
        SizedBox(height: 20,),

//        Divider(
//          color: Colors.grey,
//          indent: 30,
//          endIndent: 30,
//        ),
      ],
    );
  }
}
