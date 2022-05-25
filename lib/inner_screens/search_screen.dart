import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/drawer_screens/home_screen/cubit/home_cubit.dart';
import 'package:library_app/inner_screens/search_cubit/cubit.dart';
import 'package:library_app/inner_screens/search_cubit/state.dart';
import 'package:library_app/items/pdf_item.dart';
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

    return  BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state){}  ,
      builder: (context,state)=>

      SearchCubit.get(context).searchModel!=null ?Directionality(
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
                                  child: TextFormField(
                                      onFieldSubmitted: (value)async{
                                        await  SearchCubit.get(context).getSearch(keyWord: value);
                                    print('object123123123');
                                      },
                                    onChanged: (value) async{

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
                  child: ConditionalBuilder(
                    condition:
                    SearchCubit.get(context).searchModel.files.length != 0,
                    builder: (context) =>  ConditionalBuilder(
                      condition:SearchCubit.get(context).searchModel!=null ,
                      fallback: buildNoSearchFound,
                      builder: (context) =>  Padding(
                        padding:  EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(

                                itemBuilder: (context, index) => PdfItem(  SearchCubit.get(context).searchModel.files[index]),
                                itemCount:
                               SearchCubit.get(context).searchModel.files.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    fallback: buildNoSearchFound,
                  ),

                ),
              ],
            ),
          ),
        ),
      ):Scaffold(body:  buildSearchLoadingIndicator())
    );
  }
  Widget buildNoSearchFound(context) => Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: primaryColor,
            child: Icon(
              Icons.search_off_sharp,
              size: 60,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Sorry, No results found :(',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Did you mean: ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),



            ],
          ),
        ],
      ),
    ),
  );


}
