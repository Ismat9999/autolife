import 'dart:async';

import 'package:autolife/presantation/blocs/main_bloc/main_event.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../pages/details_page.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  bool isLoading = false;
  int currentIndex = 0;


  MainBloc() : super(MainInitialState()) {
    on<LoadMainEvent>(_onLoadMainPostsEvent);
  }
  Future<void>_onLoadMainPostsEvent(LoadMainEvent event, Emitter <MainState> emit)async{
  }
  void callDetailsPage(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage()));
  }
}
