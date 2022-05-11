import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class CustomDropDown extends StatefulWidget {
  final List<dynamic> list;
  final String Function(dynamic) buildName;
  final Function onSelect;
  final String hint;

  CustomDropDown(
    this.list, {
    Key key,
    this.buildName,
    this.onSelect,
    this.hint,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  dynamic dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    //dropdownValue = widget.list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//        if (widget.title != null)
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 20),
//            child: Padding(
//              padding: EdgeInsets.only(left: 30),
//              child: Text(
//                widget.title,
//                style: TextStyle(
//                  fontSize: 16,
//                  color: Colors.grey,
//                ),
//              ),
//            ),
//          ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Colors.grey.shade300,
              ),
            ),
            width: double.infinity,
            child: DropdownButton<dynamic>(
              hint: Text(
                widget.hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),

              ),

              value: dropdownValue,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (dynamic newValue) {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.onSelect(newValue);
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: widget.list.map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      value is String
                          ? value
                          : '${(widget.buildName != null ? widget.buildName(value) : null) ?? 'non'}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
