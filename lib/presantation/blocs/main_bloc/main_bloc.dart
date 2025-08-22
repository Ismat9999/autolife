import 'package:autolife/presantation/blocs/main_bloc/main_event.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  bool isLoading = false;
  PageController pageController = PageController();

  MainBloc() : super(MainInitialState()) {
    on<LoadMainPostsEvent>(_onLoadMainPostsEvent);
  }
  Future<void>_onLoadMainPostsEvent(LoadMainPostsEvent event, Emitter <MainState> emit)async{
  }
}
