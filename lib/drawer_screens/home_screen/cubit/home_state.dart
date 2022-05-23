

abstract class libraryStates {}
class libraryInitialState extends libraryStates {}
class HomeLoadingState extends libraryStates {}
class HomeSuccessState extends libraryStates {}
class HomeErrorState extends libraryStates {
  final  error;

  HomeErrorState(this.error);
}
class GetSectionLoadingState extends libraryStates {}
class GetSectionSuccessState extends libraryStates {}
class GetSectionErrorState extends libraryStates {}
class GetSubSectionLoadingState extends libraryStates {}
class GetSubSectionSuccessState extends libraryStates {}
class GetSubSectionErrorState extends libraryStates {}
class GetDrawerDataLoadingState extends libraryStates {}
class DrawerDataSuccessState extends libraryStates {}
class DrawerDataErrorState extends libraryStates {}
class ResultDataLoadingState extends libraryStates {}
class ResultDataSuccessState extends libraryStates {}
class ResultDataErrorState extends libraryStates {}
class GetAllSectionLoadingState extends libraryStates {}
class GetAllSectionSuccessState extends libraryStates {}
class GetAllSectionErrorState extends libraryStates {}
class RemoveFavoriteSuccessState extends libraryStates {}
class AddFavoriteSuccessState  extends libraryStates {}
class isProductInFavouriteState  extends libraryStates {}

class ChangeFavoriteState extends libraryStates {}
class GetAppDataLoadingState extends libraryStates {}
class GetAppDataSuccessState extends libraryStates {}
class GetAppDataErrorState extends libraryStates {}