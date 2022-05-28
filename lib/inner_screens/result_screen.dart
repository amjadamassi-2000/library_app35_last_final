import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/ads/banner_ad_model.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/drop_down/drop_down_button_list_item.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_app_banner.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/inner_screens/search_screen.dart';
import 'package:library_app/items/pdf_item.dart';
import 'package:library_app/models/result_model.dart';
import 'package:page_transition/page_transition.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import '../models/home_model.dart';
import '../models/result_model.dart';

class ResultScreen extends StatefulWidget {
  final myvalue1;
  final myvalue2;
  final myvalue3;
  final myvalue4;
  final Titles titles;

  ResultScreen(
      {this.myvalue1,
      this.myvalue2,
      this.myvalue3,
      this.myvalue4,
      this.titles});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController _controller = TextEditingController();

  DropDownButtonListItem _selectedstage;

  List<DropDownButtonListItem> stages = [
    DropDownButtonListItem("الأحدث", 1),
    DropDownButtonListItem("الأقدم", 2),
  ];

  List<DropDownButtonListItem> types = [
    DropDownButtonListItem("مذكرة", 1),
    DropDownButtonListItem("ملخص", 2),
  ];

  List<Files> articles = [];

  int pages = 1;
  int currentpage = 1;
  bool loading = true;
  int mytitles = null;
  ScrollController scrollController = ScrollController();

  fetchNews() {
    if (widget.titles != null) {
      mytitles = widget.titles.id;
    }
    Future.delayed(Duration.zero).then((value) {
      LibraryCubit cubit = LibraryCubit.get(context);
      pages = cubit.resultModel.totalpage;
      cubit
          .userResult(
        title_id: mytitles,
        Page: currentpage,
        section_id: widget.myvalue1,
        sub_section_id: widget.myvalue2,
        sub_sub_section_id: widget.myvalue3,
        categories: widget.myvalue4,
      )
          .then((value) {
        print('الداتا الراجعة ');
        print(value);
        articles.addAll(value);
        setState(() {
          loading = false;
        });
      });
      print(articles.length);
      print(('الارتكلست الي الانيش'));
      print(currentpage);
      print('الصفحة الحالية هي ');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('hellllllllo wooooooooooooooooord');
    fetchNews();
    scrollController.addListener(() {
      double minScroll = scrollController.position.maxScrollExtent - 200;
      double maxScroll = scrollController.position.maxScrollExtent;

      if (scrollController.position.pixels >= minScroll &&
          scrollController.position.pixels <= maxScroll) {
        print(currentpage);
        print('الصفحة الحالية هي ');

        if (currentpage <= pages) {
          currentpage++;

          fetchNews();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('object helllllo');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
    print('تم التدمير');
    articles = [];
    print(articles.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    //   print('${cubit.resultModel.files.length}طول الريسلت');

    int banarIndex = (Random().nextInt(articles.length!=0?articles.length:1));


    return cubit.resultModel.files != null
        ? Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
//              backgroundColor: primaryColor,
              drawer: MyDrawer(),
              body: SafeArea(
                child: Column(
                  children: [

                    Container(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.24,
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
                                        Builder(builder: (ctx) {
                                          return IconButton(
                                            icon: CircleAvatar(
                                              backgroundColor: Colors.grey.shade100
                                                  .withOpacity(0.3),
                                              child: Icon(
                                                Icons.filter_list,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              Scaffold.of(ctx)
                                                  .showBottomSheet<void>(
                                                (BuildContext context) {
                                                  return Container(

                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topRight: Radius.circular(25),
                                                        topLeft: Radius.circular(25),
                                                      ),

//                                                     border: Border( top: BorderSide(width: 4, color:Colors.red,),),
                                                      color: Theme.of(context).cardColor,


                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey.withOpacity(0.1),
                                                            offset: Offset(7, 0),
                                                            blurRadius: 4.0,
                                                            spreadRadius: 6
                                                        ),
                                                        BoxShadow(
                                                            color: Colors.grey.withOpacity(0.6),
                                                            offset: Offset(0, 5),
                                                            blurRadius: 4.0,
                                                            spreadRadius: 6
                                                        ),
                                                      ],








                                                    ),
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.35,
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 20 , top: 20),
                                                            child: myText(
                                                              "الإسم : ",
                                                              15,
                                                              FontWeight.w400,
                                                            ),
                                                          ),
                                                          CustomDropDown(
                                                            stages,
                                                            onSelect: (newValue) {
                                                              _selectedstage =
                                                                  newValue;
                                                            },
                                                            hint: "طرق الفلترة",
                                                          ),
                                                          SizedBox(
                                                            height: 70,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              Expanded(
                                                                child: myButton(" فلتر",
                                                                    () async {
                                                                      var mytitles2 = null;

                                                                      if (widget.titles != null) {
                                                                        mytitles2 = widget.titles.id;
                                                                      }
                                                                  //     print('helllllllllllo');
                                                                  print(_selectedstage
                                                                      .title);

                                                                  await cubit
                                                                      .userResult(
                                                                          title_id:mytitles2,
                                                                          section_id: widget
                                                                              .myvalue1,
                                                                          sub_section_id:
                                                                              widget
                                                                                  .myvalue2,
                                                                          sub_sub_section_id:
                                                                              widget
                                                                                  .myvalue3,
                                                                          categories: widget
                                                                              .myvalue4,
                                                                          sort:
                                                                              _selectedstage
                                                                                  .title)
                                                                      .then((value) {
                                                                    print(value[0].name);
                                                                    articles = [];
                                                                    setState(() {
                                                                      articles
                                                                          .addAll(value);
                                                                    });
                                                                    print(
                                                                        'thissssss value');
                                                                  });

                                                                  Navigator.of(context)
                                                                      .pop();
                                                                }),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              Expanded(
                                                                child: myButton(" إلغاء الفلترة",
                                                                        () async {
                                                                      var mytitles2 = null;

                                                                      if (widget.titles != null) {
                                                                        mytitles2 = widget.titles.id;
                                                                      }
                                                                      //     print('helllllllllllo');
                                                                      print(_selectedstage
                                                                          .title);

                                                                      await cubit
                                                                          .userResult(
                                                                          title_id:mytitles2,
                                                                          section_id: widget
                                                                              .myvalue1,
                                                                          sub_section_id:
                                                                          widget
                                                                              .myvalue2,
                                                                          sub_sub_section_id:
                                                                          widget
                                                                              .myvalue3,
                                                                          categories: widget
                                                                              .myvalue4,
                                                                          sort:
                                                                          null)
                                                                          .then((value) {
                                                                        print(value[0].name);
                                                                        articles = [];
                                                                        setState(() {
                                                                          articles
                                                                              .addAll(value);
                                                                        });
                                                                        print(
                                                                            'thissssss value');
                                                                      });

                                                                      Navigator.of(context)
                                                                          .pop();
                                                                    }),
                                                              ),
                                                            ],
                                                          ),

                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        }),
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  onTap: () {
                                    To(context, SearchScreen());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: constraint.maxHeight * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          Colors.grey.shade200.withOpacity(0.2),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "بحث",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'cairo'),
                                            textAlign: TextAlign.center,
                                          ),
                                          Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
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
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.758,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 20,
                            top: (MediaQuery.of(context).size.height -
                                    MediaQuery.of(context).padding.top) *
                                0.73 *
                                0.04),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MyAppBanner(
                                cubit.appModel.app.filepageLink,
                                cubit.appModel.app.filepageBanner != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          cubit.appModel.app.filepageBanner,
                                          width: 400,
                                          height: 70,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      )
                                    : myText(
                                        cubit.appModel.app.filepageText ?? '',
                                        14,
                                        FontWeight.w400,
                                      ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 20,
                                      top: (MediaQuery.of(context).size.height -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
                                          0.73 *
                                          0.1),
                                  child: articles.isNotEmpty
                                      ? ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          controller: scrollController,
                                          itemCount: articles.length,
                                          itemBuilder: (context, index) {
                                            if(index==banarIndex){

                                              return DelayedDisplay(
                                                  delay: const Duration(
                                                      milliseconds: 300),
                                                  child:
                                                  Column(
                                                    children: [
                                                      PdfItem(articles[index],cubit.adsModel),
                                                      SizedBox(height: 10.h,),
                                                      AdBanner2(cubit.adsModel.ads.banner??''),


                                                    ],
                                                  ));

                                            }
                                            return DelayedDisplay(
                                                delay: const Duration(
                                                    milliseconds: 300),
                                                child:
                                                    PdfItem(articles[index],cubit.adsModel));
                                          },
                                        )
                                      : DelayedDisplay(
                                          delay: Duration(seconds: 1),
                                          child: Center(
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                                child: myText('لم يتم إضافة ملفات في هذا القسم حتى الآن، سيتم العمل عليه قريبًا، انتظرونا',
                                                    20, FontWeight.w600),
                                              )))),
                            ],
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          )
        : buildSearchLoadingIndicator();
  }
}
