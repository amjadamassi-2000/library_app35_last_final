import 'package:flutter/material.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/drop_down/drop_down_button_list_item.dart';
import 'package:library_app/components/global_componnets.dart';

class HomeData {
  String title;
  List<CustomDropDown> dropdownButtons;

  HomeData(this.title, this.dropdownButtons);
}

DropDownButtonListItem _selectedstage;



List<DropDownButtonListItem> stages = [

  DropDownButtonListItem("الاعدادية",1),
  DropDownButtonListItem("الأبتدائية",2),


];


List homeList = [

  HomeData(
    "المراحل الدراسية",
    [
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
    ],
  ),

  HomeData(
    " أقسام آخرى",
    [
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
    ],
  ),

  HomeData(
    "وصفات شرقية",
    [
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
      CustomDropDown(
        stages,
        onSelect: (newValue) {
          _selectedstage = newValue;
        },
        hint: "اختر المرحلة",
      ),
    ],
  ),
];
