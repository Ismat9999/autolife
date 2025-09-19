import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class LoadMainEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}