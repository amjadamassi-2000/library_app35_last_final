import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/items/pdf_item.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: MediaQuery.of(context).size.height * 0.4),
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "بحث",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Container(
                              width: 80.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  VerticalDivider(
                                    color: Colors.white,
                                    thickness: 1.5,
                                    endIndent: 10,
                                    indent: 10,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w)
                          .add(EdgeInsets.only(top: 15)),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: primaryColor),
                            color: Colors.white,
                          ),
                          child: myText(
                            "اضغط هنا لمشاهدة شرح تحميل الملفات",
                            14,
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return PdfItem();
                          }),
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
