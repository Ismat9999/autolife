import '../../../domain/model/member_model.dart';

abstract class SearchState {}

class SearchsInitialState extends SearchState {}

class SearchsLoadingState extends SearchState {}

class SearchsSuccsesState extends SearchState {
  List<Member> items;

  SearchsSuccsesState({required this.items});
}

class SearchsFailureState extends SearchState {
  final String errorMessage;

  SearchsFailureState(this.errorMessage);
}