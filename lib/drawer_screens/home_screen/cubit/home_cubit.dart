
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/all_Section.dart';
import '../../../models/drawer_model.dart';
import '../../../models/home_model.dart';
import '../../../models/result_model.dart';
import '../../../models/section_model.dart';
import '../../../models/sub_sectionModel.dart';
import '../../../shared/constants.dart';
import '../../../shared/remote/dio_helper.dart';
import 'home_state.dart';

class LibraryCubit extends Cubit<libraryStates> {
  LibraryCubit() : super(libraryInitialState());


  static LibraryCubit get(context) => BlocProvider.of(context);

  HomeModel homeModel;

  void getHomeData() async {
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
      emit(HomeErrorState());
      print(error.toString());
    });
  }

  SectionModel sectionModel;
  void getSection({ int id}) async {
    emit(GetSectionLoadingState());
    await DioHelper.getData(
      url: '$GET_SECTION/$id',
    ).then((value) {
      sectionModel=SectionModel.fromJson(value.data);
      emit(GetSectionSuccessState());
    }).catchError((error) {
      emit(GetSectionErrorState());
      print(error.toString());
    });
  }
  SubSectionModel subsectionModel;
  void getsubSection({ int id}) async {
    emit(GetSubSectionLoadingState());
    await DioHelper.getData(
      url: '$GET_SUBSECTION/$id',
    ).then((value) {
      subsectionModel=SubSectionModel.fromJson(value.data);
      print(subsectionModel.message);
      emit(GetSubSectionSuccessState());
    }).catchError((error) {
      emit(GetSubSectionErrorState());
      print(error.toString());
    });
  }
  DrawerModel drawerModel;
  void getDrawerData() async {
    emit(GetDrawerDataLoadingState());
    await DioHelper.getData(
      url: GET_DRAWER,
    ).then((value) {
      drawerModel=DrawerModel.fromJson(value.data);
      print(drawerModel.message);
      emit(DrawerDataSuccessState());
    }).catchError((error) {
      emit(DrawerDataErrorState());
      print(error.toString());
    });
  }
  ResultModel resultModel;
  Future <void> userResult({
   int title_id,
 int   section_id
    ,
   int sub_section_id,
    int sub_sub_section_id,
int categories

  }) async {
    emit(ResultDataLoadingState());
    await DioHelper.postData(
        url: RESULT,


        data: {
          'title_id': title_id,
          'section_id': section_id,
          'sub_section_id': sub_section_id,
          'sub_sub_section_id':sub_sub_section_id,
          'categories':categories

        }).then((value) {
      resultModel = ResultModel.fromJson(value.data);
      print(('تم عرض النتائج بنجاح'));
      print({resultModel.files.length});
      print(value.data);

      emit(ResultDataSuccessState());
    }).catchError((error) {
      emit(ResultDataErrorState());
    });
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


}