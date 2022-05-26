import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_drawer.dart';

import '../inner_screens/theme_cubit/cubit.dart';
import '../inner_screens/theme_cubit/state.dart';
import '../shared/remote/local/cache_helper.dart';
import 'home_screen/cubit/home_cubit.dart';




class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _switchValue=!CacheHelper.getBoolean(key: 'isDark');


  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds:2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: " اضغط مرة أخرى للخروج" , textColor: Colors.white);
      return Future.value(false);
    }
    return Future.value(true);
  }



  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return BlocConsumer<ThemeCubit,ThemeStates>(

      listener: (context,state){},
      builder: (context,state)=> Directionality(
        textDirection: TextDirection.rtl,
        child:  Scaffold(
          drawer: MyDrawer(),
          body: WillPopScope(
            child: SafeArea(
              child: Column(
                children: [


                  SizedBox(
                    height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.25,
                    child: LayoutBuilder(
                      builder: (ctx,constraint)
                      =>Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: constraint.maxHeight*0.3,

                            child: Row(
                              children: [
                                Builder(
                                  builder: (BuildContext ctx) {
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
                                        Scaffold.of(ctx).openDrawer();
                                      },
                                      tooltip: MaterialLocalizations.of(context)
                                          .openAppDrawerTooltip,
                                    );
                                  },
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Image.network("${cubit.appModel.app.logo}}", width:  170,height: constraint.maxHeight*0.7,),
                        ],
                      ),
                    ),
                  ),





                  Container(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.75,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [

                        SizedBox(height: 60,),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).secondaryHeaderColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 0),
                                    blurRadius: 5.0,
                                    spreadRadius: 0),
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(1, 0),
                                    blurRadius:3.0,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  myText(
                                      "الوضع المظلم",
                                      14,
                                      FontWeight.w300
                                  ),

                                  CupertinoSwitch(
                                    value: _switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        ThemeCubit.get(context).changeAppMode(fromShared: !value);

                                        _switchValue = value;
                                        print(CacheHelper.getBoolean(key: 'isDark'));
                                      });
                                    },
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  ),
                ],
              ),
            ),
            onWillPop: onWillPop,
          ),

        ),
      ),
    );
  }
}
