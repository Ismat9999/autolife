
import 'package:autolife/presantation/blocs/search_bloc/search_event.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  bool isLoading = false;
  var searchController=TextEditingController();

  SearchBloc() : super(SearchsInitialState()) {
    on<LoadSearchMemberEvent>(_onLoadSearchMemberEvent);
  }

  Future<void> _onLoadSearchMemberEvent(
      LoadSearchMemberEvent event, Emitter<SearchState> emit) async {}
}
