import 'package:equatable/equatable.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();
}

class NavigatorSearchEvent extends NavigatorEvent {
  @override
  List<Object?> get props => [];
}