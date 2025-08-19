import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class LoadMainPostsEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}
// class RemoveMainPostsEvent extends MainEvent {
//   Post post;
//
//   RemovemainPostsEvent({required this.post});
//
//   @override
//   List<Object?> get props => [];
// }