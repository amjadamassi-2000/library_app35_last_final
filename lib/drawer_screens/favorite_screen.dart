import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/inner_screens/allCategoriesTapScreen.dart';
import 'package:library_app/inner_screens/favoriteTapScreen.dart';
import 'package:library_app/items/pdf_item.dart';



class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: primaryColor,
            drawer: MyDrawer(),

            body:  Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.3,
                  child: LayoutBuilder(
                    builder: (ctx,constraint)=>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 2),
                                height: constraint.maxHeight*0.05,
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
                              Spacer(),

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: constraint.maxHeight*0.1),
                          child: Image.asset("assets/images/lib_logo.png", width:  150,height: constraint.maxHeight*0.45,),
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            height: constraint.maxHeight*0.3,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                color: Color(0xff4747d1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tabs: [
                                Tab(
                                 child: Text(
                                   "المفضلة",
                                   style: GoogleFonts.cairo(
                                     fontSize: 12.sp,
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                ),

                                Tab(
                                  child: Text(
                                    "كل الأقسام",
                                    style: GoogleFonts.cairo(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
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
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
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
                     SizedBox(height: 20,),

                     Expanded(
                        child: TabBarView(
                          children: [
                            FavoriyeTapScreen(),
                            AllCategoriesTapScreen(),

                          ],
                        ),
                      ),
                   ],
                 ),
                ),
              ],
            ),



          ),
        ),
    );
  }
}



/*



Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 200,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                       tabs: [
                         Tab(text: "المفضلة",),
                         Tab(text: "كل الأقسام",),
                       ],

                    ),
                  ),
                ),

                SizedBox(height: 0,),

                Expanded(
                  child: TabBarView(
                    children: [
                      FavoriyeTapScreen(),
                      AllCategoriesTapScreen(),

                    ],
                  ),
                ),


              ],
            ),
 */