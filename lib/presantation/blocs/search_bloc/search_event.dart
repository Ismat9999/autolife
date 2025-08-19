import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class LoadSearchMemberEvent extends SearchEvent {
  String keyword;

  LoadSearchMemberEvent({required this.keyword});

  @override
  List<Object?> get props => [];
}