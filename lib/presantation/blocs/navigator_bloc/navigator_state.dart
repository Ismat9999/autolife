abstract class NavigatSearchState {}

class NavigatorInitialState extends NavigatSearchState {}

class NavigatorLoadingState extends NavigatSearchState {}

class NavigatorSuccsesState extends NavigatSearchState {}

class NavigatorFailureState extends NavigatSearchState {
  final String errorMessage;

  NavigatorFailureState(this.errorMessage);
}