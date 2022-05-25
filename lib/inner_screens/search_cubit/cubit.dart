
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/inner_screens/search_cubit/state.dart';

import '../../models/search_model.dart';
import '../../shared/constants.dart';
import '../../shared/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);


  SearchModel searchModel;
  var controller = TextEditingController();

  void getSearch({ String keyWord}) {
    emit(SearchLoadingState());
    DioHelper.postData(url: Search, data: {
      "search": keyWord,
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print('object');
      emit(SearchSuccessState());
    }).catchError((error) {
      print("Search Error : $error");
      emit(SearchErrorState(error));
    });
  }

  void clearSearchData() {
    controller.clear();
    searchModel = null;
  }
}

