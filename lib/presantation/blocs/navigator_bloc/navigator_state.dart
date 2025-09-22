abstract class NavigatorSearchState {}

class NavigatorInitialState extends NavigatorSearchState {}

class NavigatorLoadingState extends NavigatorSearchState {}

class NavigatorSuccsesState extends NavigatorSearchState {}

class NavigatorFailureState extends NavigatorSearchState {
  final String errorMessage;

  NavigatorFailureState(this.errorMessage);
}