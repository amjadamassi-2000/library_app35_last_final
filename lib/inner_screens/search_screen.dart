import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/drawer_screens/home_screen/cubit/home_cubit.dart';
import 'package:library_app/inner_screens/search_cubit/cubit.dart';
import 'package:library_app/inner_screens/search_cubit/state.dart';
import 'package:library_app/items/pdf_item.dart';
import 'package:library_app/models/home_model.dart';

import '../drawer_screens/home_screen/cubit/home_state.dart';

class SearchScreen extends StatefulWidget {
  final myvalue1;
  final myvalue2;
  final myvalue3;
  final myvalue4;

  final Titles titles;

  SearchScreen(
      {this.myvalue1,
      this.myvalue2,
      this.myvalue3,
      this.myvalue4,
      this.titles});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LibraryCubit cubit = LibraryCubit.get(context);
cubit.clearSearchData();
print('object disbose');

  }
  var formKey = GlobalKey<FormState>();
  FocusNode _focusSearch = new FocusNode();

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return BlocConsumer<LibraryCubit, libraryStates>(
        listener: (context, state) {},
        builder: (context, state) => LibraryCubit.get(context).resultModel !=
                null
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
//          backgroundColor: primaryColor,
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.25,
                          child: LayoutBuilder(
                            builder: (ctx, constraint) => SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: constraint.maxHeight * 0.05),
                                    child: Image.network(
                                      cubit.appModel.app.logo,
                                      width: 150,
                                      height: constraint.maxHeight * 0.35,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: constraint.maxHeight * 0.35,
                                      child: Form(
                                        key: formKey,
                                        child: TextFormField(
                                          focusNode: _focusSearch,
                                          controller: LibraryCubit.get(context)
                                              .controller,
                                          onFieldSubmitted: (value) async {
                                            var mytitles2 = null;

                                            if (widget.titles != null) {
                                              mytitles2 = widget.titles.id;
                                            }
                                             LibraryCubit.get(context)

                                                .userResult(

                                                   sub_sub_section_id: widget.myvalue3,
                                                    search: value,
                                                    section_id: widget.myvalue1,
                                                    sub_section_id:
                                                        widget.myvalue2,

                                                    categories: widget.myvalue4)
                                                .then((value) => print(value.length));
                                            print('object123123123');
                                          },
                                          onChanged: (value) async {},
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "بحث",
                                            contentPadding: EdgeInsets.all(12),
                                            isDense: true,
                                            hintStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'cairo',
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey.shade300
                                                .withOpacity(0.3),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            suffixIcon: const Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
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
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.02,
                        ),
                        Container(
                          width: double.infinity,
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.73,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: ConditionalBuilder(
                            condition: LibraryCubit.get(context)
                                .resultModel
                                .files
                                .isNotEmpty,
                            builder: (context) => ConditionalBuilder(
                              condition:
                                  LibraryCubit.get(context).resultModel != null,
                              fallback: buildNoSearchFound,
                              builder: (context) => Padding(
                                padding: EdgeInsets.all(20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        itemBuilder: (context, index) =>
                                            PdfItem(
                                                LibraryCubit.get(context)
                                                    .resultModel
                                                    .files[index],
                                                cubit.adsModel),
                                        itemCount: LibraryCubit.get(context)
                                            .resultModel
                                            .files
                                            .length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            fallback: buildNoSearchFound,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(body: buildSearchLoadingIndicator()));
  }

  Widget buildNoSearchFound(context) => Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.search_off_sharp,
                    size: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                myText(
                    'الجملة التي كتبتها لا تطابق اسم ملف متاح ، حاول استخدام كلمات دقيقة',
                    16,
                    FontWeight.bold),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    myText('أمثلة لبحث سريع ودقيق :', 14, FontWeight.bold),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                      onPressed: () {
                        LibraryCubit.get(context)
                            .userResult(search: "مذكرة رياضيات");
                        LibraryCubit.get(context).controller.text =
                            "مذكرة رياضيات";
                      },
                      child: const Text(
                        'مذكرة رياضيات',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        LibraryCubit.get(context)
                            .userResult(search: "مذكرة المصطفى");
                        LibraryCubit.get(context).controller.text =
                            "مذكرة المصطفى";
                      },
                      child: const Text(
                        'مذكرة المصطفى',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        LibraryCubit.get(context)
                            .userResult(search: "مستر مصطفى الكيلاني");
                        LibraryCubit.get(context).controller.text =
                            "مستر مصطفى الكيلاني";
                      },
                      child: const Text(
                        'مستر مصطفى الكيلاني',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        LibraryCubit.get(context)
                            .userResult(search: "سلسلة التفوق");
                        SearchCubit.get(context).controller.text =
                            "سلسلة التفوق";
                      },
                      child: const Text(
                        'سلسلة التفوق',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                            fontFamily: 'cairo'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
