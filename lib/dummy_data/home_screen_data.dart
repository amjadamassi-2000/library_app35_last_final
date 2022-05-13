import 'package:flutter/material.dart';
import 'package:library_app/components/custom_drop_down.dart';

class HomeData {
  String title;
  List<CustomDropDown> dropdownButtons;

  HomeData(this.title, this.dropdownButtons);
}

String _selectedstage;
List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];

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
    "أقسام آخرى",
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
