import 'package:autolife/presantation/blocs/navigator_bloc/navigator_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorSearchEvent,NavigatSearchState> {
  bool isLoading = false;
  var captionController = TextEditingController();


  NavigatorBloc() : super(NavigatorInitialState()) {
    on<NavigatorSearchEvent>(_onNavigatorSearchEvent);
  }

  Future<void> _onNavigatorSearchEvent(NavigatorSearchEvent event,
      Emitter<NavigatSearchState> emit) async {}
}