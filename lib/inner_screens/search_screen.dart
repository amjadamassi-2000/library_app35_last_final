import 'package:flutter/material.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/drawer_screens/home_screen/cubit/home_cubit.dart';
import 'package:library_app/models/home_model.dart';




class SearchScreen extends StatefulWidget {

  final myvalue1;
  final myvalue2;
  final myvalue3;
  final myvalue4;

  final  Titles titles;

  SearchScreen({this.myvalue1, this.myvalue2, this.myvalue3, this.myvalue4,
    this.titles});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {



  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);


    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) * 0.25 ,
                child: LayoutBuilder(
                  builder: (ctx, constraint) =>
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

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

              ),
            ],
          ),
        ),
      ),
    );
  }
}
