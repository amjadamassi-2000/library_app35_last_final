import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/ads/cubit/states.dart';

import '../../models/ads_model.dart';
import '../../shared/constants.dart';
import '../../shared/remote/dio_helper.dart';

class AdsCubit extends Cubit<AdsStates> {
  AdsCubit() : super(AdsInitialState());

  static AdsCubit get(context) => BlocProvider.of(context);

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


}