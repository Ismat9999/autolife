import '../../../domain/model/post_model.dart';

abstract class MainState {}

class MainInitialState extends MainState {}

class MainLoadingState extends MainState {}

class MainSuccsesState extends MainState {
  List<Post> items;

 MainSuccsesState({required this.items});
}

class MainFailureState extends MainState {
  final String errorMessage;

  MainFailureState(this.errorMessage);
}

class RemoveMainPostsState extends MainState {
  RemoveMainPostsState();
}