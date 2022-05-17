
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/home_model.dart';
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
      print('تم جلب البيانات بنجاح ');




      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState());
      print(error.toString());
    });
  }
}