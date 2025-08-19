import 'package:equatable/equatable.dart';

abstract class UploadEvent extends Equatable {
  const UploadEvent();
}

class UploadPostsEvent extends UploadEvent {
  @override
  List<Object?> get props => [];
}