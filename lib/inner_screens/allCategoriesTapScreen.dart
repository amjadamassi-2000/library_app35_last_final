import 'package:flutter/material.dart';
import 'package:library_app/items/favorit_item.dart';
import 'package:library_app/items/pdf_item.dart';





class AllCategoriesTapScreen extends StatefulWidget {
  @override
  _AllCategoriesTapScreenState createState() => _AllCategoriesTapScreenState();
}

class _AllCategoriesTapScreenState extends State<AllCategoriesTapScreen> {
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
        itemCount: 10,
        itemBuilder: (context , index){
          return FavoriteItem();
        }

    );
  }
}
