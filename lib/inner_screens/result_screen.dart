import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/drop_down/drop_down_button_list_item.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_app_banner.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/items/pdf_item.dart';
import 'package:library_app/models/result_model.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import '../models/home_model.dart';
import '../models/result_model.dart';

class ResultScreen extends StatefulWidget {
  final myvalue1;
  final myvalue2;
  final myvalue3;
  final myvalue4;
  final  Titles titles;

  ResultScreen({this.myvalue1, this.myvalue2, this.myvalue3, this.myvalue4,
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
    DropDownButtonListItem("الإسم", 3),
  ];

  List<DropDownButtonListItem> types = [
    DropDownButtonListItem("مذكرة", 1),
    DropDownButtonListItem("ملخص", 2),
  ];

  List<Files> articles=[];


  int pages=2;
  int currentpage=1;
  bool loading=true;
  int mytitles=null;
  ScrollController scrollController=ScrollController();
  fetchNews(){
    if(widget.titles!=null){
      mytitles=widget.titles.id;

    }
    Future.delayed(Duration.zero).then((value) {
      LibraryCubit cubit = LibraryCubit.get(context);
        cubit.userResult(
         title_id:mytitles
,
         Page: currentpage,section_id: widget.myvalue1,
        sub_section_id: widget.myvalue2,
        sub_sub_section_id: widget.myvalue3,
        categories: widget.myvalue4,
    ).then((value) {
        print('الداتا الراجعة ');
        print(value);
        articles.addAll(value);
        setState(() {
          loading=false;


        });
      });
      print(articles.length);
      print(('الارتكلست الي الانيش' ));
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
           double minScroll=scrollController.position.maxScrollExtent-200;
           double maxScroll=scrollController.position.maxScrollExtent;

           if(scrollController.position.pixels>=minScroll&&scrollController.position.pixels<=maxScroll){
             print(currentpage);
             print('الصفحة الحالية هي ');

            if(currentpage<=pages){
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
    articles=[];
    print(articles.isEmpty);


  }

  @override
  Widget build(BuildContext context) {


    LibraryCubit cubit = LibraryCubit.get(context);
    print('${cubit.resultModel.files.length}طول الريسلت');

    int banarIndex = Random().nextInt(cubit.resultModel.files.length!=0?cubit.resultModel.files.length:1);

    return BlocConsumer<LibraryCubit, libraryStates>(
        builder: (context, state) {
          return state is ResultDataSuccessState ?Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: primaryColor,
              drawer: MyDrawer(),
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height -
                          MediaQuery
                              .of(context)
                              .padding
                              .top) *
                          0.25,
                      child: LayoutBuilder(
                        builder: (ctx, constraint) =>
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: constraint.maxHeight * 0.25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              child: IconButton(
                                                icon: CircleAvatar(
                                                  backgroundColor: Colors.grey
                                                      .shade100
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
                                                  });                                                },
                                                tooltip: MaterialLocalizations
                                                    .of(context)
                                                    .openAppDrawerTooltip,
                                              ),
                                            );
                                          },
                                        ),
                                        Builder(builder: (ctx) {
                                          return IconButton(
                                            icon: CircleAvatar(
                                              backgroundColor:
                                              Colors.grey.shade100.withOpacity(0.3),
                                              child: Icon(
                                                Icons.filter_list,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              Scaffold.of(ctx).showBottomSheet<void>(
                                                    (BuildContext context) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topRight: Radius.circular(
                                                            30.r),
                                                        topLeft: Radius.circular(
                                                            30.r),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    height: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height *
                                                        0.35,
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 20),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                right: 20),
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

                                                          myButton(" فلتر", () async{
                                                            //     print('helllllllllllo');
                                                            print(
                                                                _selectedstage.title);
                                                           await cubit.userResult(
                                                                title_id:
                                                                widget.titles.id,
                                                                section_id:
                                                                widget.myvalue1,
                                                                sub_section_id:
                                                                widget.myvalue2,
                                                                sub_sub_section_id:
                                                                widget.myvalue3,
                                                                categories:
                                                                widget.myvalue4,
                                                                sort:
                                                                _selectedstage.title
                                                            ).then((value) async{
                                                              return await ToAndFinish(
                                                                context,
                                                                ResultScreen(myvalue1: widget.myvalue1,myvalue2:  widget.myvalue2, myvalue3: widget.myvalue3,myvalue4:  widget.myvalue4,
                                                                   titles:  widget.titles));
                                                            });

                                                            Navigator.of(context).pop();

                                                          }
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
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: constraint.maxHeight * 0.05),
                                    child: Image.network(
                                      cubit.appModel.app.logo,
                                      width: 150,
                                      height: constraint.maxHeight * 0.35,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: constraint.maxHeight * 0.35,
                                      child: TextField(
                                        onChanged: (value) async{
                                          await cubit.userResult(
                                              section_id: widget.myvalue1,
                                              sub_section_id: widget.myvalue2,
                                              sub_sub_section_id: widget.myvalue3,
                                              categories: widget.myvalue4,
                                              title_id: widget.titles.id,
                                              search: value);
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "بحث",
                                          contentPadding: EdgeInsets.all(12),
                                          isDense: true,
                                          hintStyle:TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                              fontFamily: 'cairo',

                                          ),
                                          filled: true,
                                          fillColor:
                                          Colors.grey.shade300.withOpacity(0.3),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(
                                                  10)),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: Colors.white,
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
                    SizedBox(
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height -
                          MediaQuery
                              .of(context)
                              .padding
                              .top) *
                          0.02,
                    ),
                    Container(
                      width: double.infinity,
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height -
                          MediaQuery
                              .of(context)
                              .padding
                              .top) *
                          0.73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MyAppBanner(
                            cubit.appModel.app.filepageLink,
                          cubit.appModel.app.filepageBanner!=null ?  ClipRRect(
                            borderRadius:
                            BorderRadius.circular(8.0),
                            child: Image.network(

                              cubit.appModel.app.filepageBanner,

                              width: 400,
                              height: 70,
                              fit:BoxFit.fitWidth,
                            ),
                          ):




                            myText(
                              cubit.appModel.app.filepageText??'',
                              14,
                              FontWeight.w400,
                            ),

                          ),

                          // MyAppBanner(
                          //   "https://www.facebook.com/amjad.abed.948",
                          //   myText(
                          //     "اضغط هنا لمشاهدة شرح تحميل الملفات",
                          //     14,
                          //     FontWeight.w400,
                          //   ),
                          // ),






                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child:articles.isNotEmpty?

                              ListView.builder (
                                controller: scrollController,
                                  itemCount: articles.length,
                                  itemBuilder: (context, index) {

                                    return    PdfItem(articles[index]);
                               //     final passenger = cubit.passengers[index];

//                                     // final passenger=cubit.files[index];
//                                     if (index == banarIndex) {
//                                       return Padding(
//                                         padding: EdgeInsets.symmetric(vertical: 20),
//                                         child: Column(
//                                           children: [
//                                             AdBanner2(cubit.adsModel.ads.banner),
//                                             SizedBox(height: 10,),
//                                             if(cubit.resultModel.files.length!=0)
//                                             PdfItem(cubit.resultModel.files[index]),
//
//                                           ],
//                                         )
//                                       );
//                                     } else
// //AdBanner2
//                                       return PdfItem(cubit.resultModel.files[index]);

                                  }):Center(child: myText('لا يوجد بيانات', 25, FontWeight.bold))
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ):Center(child: CircularProgressIndicator());

        }
    );
  }
}
