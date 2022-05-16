import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/dummy_data/pdf_files_datd.dart';
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
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        body: SafeArea(
          child: Column(
            children: [

              Container(
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.25,
                child: LayoutBuilder(
                  builder: (ctx,constraint)
                 => SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        Container(

                          height: constraint.maxHeight*0.25 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: IconButton(

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
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  backgroundColor:
                                  Colors.grey.shade100.withOpacity(0.3),
                                  child: Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(bottom:  constraint.maxHeight*0.05),
                          child: Image.asset("assets/images/lib_logo.png", width:  150,height: constraint.maxHeight*0.35,),
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height:  constraint.maxHeight*0.35,
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "بحث",
                                contentPadding:  EdgeInsets.all(12), isDense: true,
                                hintStyle: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade300.withOpacity(0.3),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon:  Icon(
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
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.02,
              ),

              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.73,
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
                      padding: EdgeInsets.symmetric(horizontal: 30)
                          .add(EdgeInsets.only(top: 15)),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
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
                      child: Padding(
                        padding:  EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                            itemCount: dataFiles.length,
                            itemBuilder: (context, index) {
                              return dataFiles.map((e) => PdfItem(dataFiles[index])).toList()[index];
                            }),
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
