import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/home_model.dart';
class my_dropdown extends StatefulWidget {
  final    List<dynamic>titles;
  String myvalue;

   my_dropdown( this.titles, this.myvalue) ;

  @override
  State<my_dropdown> createState() => _my_dropdownState();
}

class _my_dropdownState extends State<my_dropdown> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Container(
        margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),

        child: IgnorePointer(
          ignoring: false,
          child: DropdownButton(
            isExpanded: true,


            value: widget.myvalue,
            onChanged: (value){
              setState(() {
                widget.myvalue=value;
              });

            },
            items:widget.titles.map((e) => DropdownMenuItem(value: e.name,child: Text(e.name))).toList() ,
          ),
        ),
      ),
    );
  }
}
