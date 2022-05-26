// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:library_app/items/favorit_item.dart';
import 'package:library_app/items/pdf_item.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';





class AllCategoriesTapScreen extends StatefulWidget {
  const AllCategoriesTapScreen({Key key}) : super(key: key);

  @override
  _AllCategoriesTapScreenState createState() => _AllCategoriesTapScreenState();
}

class _AllCategoriesTapScreenState extends State<AllCategoriesTapScreen> {
  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return   ListView.builder(
        itemCount: cubit.allSectionModel.sections.length??0,
        itemBuilder: (context , index){
          return FavoriteItem(cubit.allSectionModel.sections[index]);
        }

    );
  }
}
