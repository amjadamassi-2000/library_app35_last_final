import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/ads_model.dart';
import '../../../models/all_Section.dart';
import '../../../models/app_model.dart';
import '../../../models/drawer_model.dart';
import '../../../models/home_model.dart';
import '../../../models/result_model.dart';
import '../../../models/section_model.dart';
import '../../../models/sub_sectionModel.dart';
import '../../../shared/constants.dart';
import '../../../shared/remote/dio_helper.dart';
import '../../../shared/shared_pref_helper.dart';
import 'home_state.dart';

class LibraryCubit extends Cubit<libraryStates> {
  LibraryCubit() : super(libraryInitialState());

  static LibraryCubit get(context) => BlocProvider.of(context);








  HomeModel homeModel;

  Future <void> getHomeData() async {
    emit(HomeLoadingState());
    await DioHelper.getData(
      url: HOME,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print('${homeModel.message} ');
      print('${homeModel.titles.length} ');
      print('تم جلب البيانات بنجاح ');

      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(error));
      print(error.toString());
    });
  }

  SectionModel sectionModel;

  void getSection({int id}) async {
    emit(GetSectionLoadingState());
    await DioHelper.getData(
      url: '$GET_SECTION/$id',
    ).then((value) {
      sectionModel = SectionModel.fromJson(value.data);
      emit(GetSectionSuccessState());
    }).catchError((error) {
      emit(GetSectionErrorState());
      print(error.toString());
    });
  }

  SubSectionModel subsectionModel;

  void getsubSection({int id}) async {
    emit(GetSubSectionLoadingState());
    await DioHelper.getData(
      url: '$GET_SUBSECTION/$id',
    ).then((value) {
      subsectionModel = SubSectionModel.fromJson(value.data);

      print(subsectionModel.message);
      emit(GetSubSectionSuccessState());
    }).catchError((error) {
      emit(GetSubSectionErrorState());
      print(error.toString());
    });
  }

  DrawerModel drawerModel;

  Future <void> getDrawerData() async {
    emit(GetDrawerDataLoadingState());
    await DioHelper.getData(
      url: GET_DRAWER,
    ).then((value) {
      drawerModel = DrawerModel.fromJson(value.data);
      print(drawerModel.message);
      emit(DrawerDataSuccessState());
    }).catchError((error) {
      emit(DrawerDataErrorState());
      print(error.toString());
    });
  }

  ResultModel resultModel;
 // List<Files> passengers =[];
int totalPages =2;
  Files file;
  //final RefreshController refreshController=RefreshController(initialRefresh: false);
 Future<List<Files>> userResult(
      {
        int Page =1,

        bool isRefresh=false,
        String search,
      int title_id,
      int section_id,
      int sub_section_id,
      int sub_sub_section_id,
      int categories,
      String sort}) async {
   List<Files> articles=[];


   // if (isRefresh) {
   // //  currentPage = 1;
   //   print('${currentPage} 1 هداااااا الكرنت بيج');
   //
   // } else {
   //   if (currentPage >= totalPages) {
   //     refreshController.loadNoData();
   //     return false;
   //   }
   // }

    emit(ResultDataLoadingState());


    await DioHelper.postData(url: '$RESULT?page=$Page', data: {
      'section_id':section_id,
      'title_id': title_id,
      'sub_section_id': sub_section_id,
      'sub_sub_section_id': sub_sub_section_id,
      'categories': categories,
      'sort': sort,
      'search': search
    }).then((value) {

      resultModel=ResultModel.fromJson(value.data);
      print(resultModel.files.length);
      print('الطول العام');




      var jsonArticles=value.data['files'];
      articles.addAll(resultModel.files);
      print(articles.length);

      print('الطول الاركتلكست العام');

      // for(var item in  jsonArticles){
      //   articles.add(Files.fromJson(jsonArticles));
      //
      // }

     // articles.add(resultModel.files);


      // if (isRefresh) {
      //   passengers = resultModel.files;
      // }else{
      //   passengers.addAll(resultModel.files);
      // }

      // currentPage++;
      // print('${currentPage} 2 هداااااا الكرنت بيج');
      // print(passengers.length);
      // print('طوووووول البسنجر');


print(articles.length);

      emit(ResultDataSuccessState());

    }).catchError((error) {
      print(error.toString());
      print('هداااااااا الايرور');
      emit(ResultDataErrorState());
    });
   return articles;

 }

  AllSectionModel allSectionModel;

  void getAllSection() async {
    emit(GetAllSectionLoadingState());
    await DioHelper.getData(
      url: GET_All_SECTION,
    ).then((value) {
      allSectionModel = AllSectionModel.fromJson(value.data);
      print('${allSectionModel.message} ');
      print('${allSectionModel.sections.length} ');
      print('تم جلب البيانات بنجاح ');

      emit(GetAllSectionSuccessState());
    }).catchError((error) {
      emit(GetAllSectionErrorState());
      print(error.toString());
    });
  }









  AppModel appModel;

  void getAppData() async {
    emit(GetAppDataLoadingState());
    await DioHelper.getData(
      url: APP,
    ).then((value) {
      appModel = AppModel.fromJson(value.data);
      print('${appModel.message} ');
      print('تم جلب البيانات بنجاح ');

      emit(GetAppDataLoadingState());
    }).catchError((error) {
      emit(GetAppDataLoadingState());
      print(error.toString());
    });
  }

  List<Sections> favouritesProduct = [];
  final sharedPrefHelper = SharedPrefHelper.sharedPrefHelper;

  getAllFavouriteProducts() {
    favouritesProduct = allSectionModel.sections
        .where((product) => sharedPrefHelper.isProductInFavourite(product.id))
        .toList();
    emit(AddFavoriteSuccessState());
  }

  addProductToFavourite(int id) {
    sharedPrefHelper.addProductToFavourite(id);
    getAllFavouriteProducts();
  }

  deleteProductFromFavourite(int id) {
    sharedPrefHelper.deleteProductFromFavourite(id);
    getAllFavouriteProducts();
  }

  onPressedFavouriteButton(int id) {
    sharedPrefHelper.isProductInFavourite(id)
        ? deleteProductFromFavourite(id)
        : addProductToFavourite(id);
  }

  isProductInFavourite(id) {
    sharedPrefHelper.isProductInFavourite(id);

    emit(isProductInFavouriteState());
  }

  AdsModel adsModel;

  void getAdsData() async {
    emit(AdsLoadingState());
    await DioHelper.getData(
      url: ADS,
    ).then((value) {
      print('values ads sucess');
      adsModel=AdsModel.fromJson(value.data);
      emit(AdsSuccessState());
    }).catchError((error) {
      emit(AdsErrorState());
    });
  }

//
// getSingleProduct(int id) async {
//   singleProduct = null;
//   Map product = await apiHelper.getSingleProduct(id);
//   singleProduct = Sections.fromJson(product);
//   notifyListeners();
// }

//   List <Sections> favoriteSection = [];
//   void toggleFavorite( SectionlId){
//     final existingIndex = favoriteSection.indexWhere((Section)=> Section.id == SectionlId);
//     if(existingIndex >= 0){
//
//       //setState
//       favoriteSection.removeAt(existingIndex);
//       emit(RemoveFavoriteSuccessState());
//     }else{
// //setState
//       favoriteSection.add(allSectionModel.sections.firstWhere((Section) => Section.id == SectionlId));
//         print('${favoriteSection[0].name} هدااااااااااااااااااااا   الميل ');
//         print('${favoriteSection[1].name} هدااااااااااااااااااااا   الميل ');
//       print('${favoriteSection[2].name} هدااااااااااااااااااااا   الميل ');
//       print('${favoriteSection[3].name} هدااااااااااااااااااااا   الميل ');
//       print('${favoriteSection[4].name} هدااااااااااااااااااااا   الميل ');
//       print('${favoriteSection[5].name} هدااااااااااااااااااااا   الميل ');
//
//       emit(AddFavoriteSuccessState());
//
//
//     }
//
//
//   }
// bool isfav=false;
//  ChangeFavorite(bool isfavorite){
//   isfav= isfavorite;
//   print(isfavorite);
//     emit(ChangeFavoriteState());
//
// }

}
