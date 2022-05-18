
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/home_model.dart';
import '../../../models/section_model.dart';
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

}