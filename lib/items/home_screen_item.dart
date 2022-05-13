import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/ads/interstitial_ad_model.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/dummy_data/home_screen_data.dart';
import 'package:library_app/inner_screens/result_screen.dart';

class HomeScreenItem extends StatefulWidget {


   final HomeData homeData;
  HomeScreenItem(this.homeData);

  @override
  State<HomeScreenItem> createState() => _HomeScreenItemState();
}

class _HomeScreenItemState extends State<HomeScreenItem> {
  String _selectedstage;

  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];



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

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: myText(
              widget.homeData.title,
              15,
              FontWeight.w600,
          ),
        ),

//        SizedBox(height: 10.h,),



        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.homeData.dropdownButtons.length,
                          itemBuilder: (context, index) {
                            return widget.homeData.dropdownButtons[index];
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h,),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w)
              .add(EdgeInsets.only(top:0.h)),
          child: myButton("عرض النتائج", () {


            Adinterstitial.showInterstitialAd();

            To(context ,ResultScreen() );


          }),
        ),
        SizedBox(height: 20.h,),

        Divider(
          color: Colors.grey,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
