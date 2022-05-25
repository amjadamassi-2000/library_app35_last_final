abstract class SearchStates {}
class SearchInitialState extends SearchStates {}
class SearchLoadingState extends SearchStates {}
class SearchSuccessState extends SearchStates {}
class SearchErrorState extends SearchStates {
  final erorr;

  SearchErrorState(this.erorr);
}