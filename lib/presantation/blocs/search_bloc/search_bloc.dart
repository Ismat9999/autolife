
import 'package:autolife/presantation/blocs/search_bloc/search_event.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/model/post_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  bool isLoading = false;
  var searchController=TextEditingController();
  List<Post> items = [];

  SearchBloc() : super(SearchsInitialState()) {
    on<LoadSearchMemberEvent>(_onLoadSearchMemberEvent);
  }

  Future<void> _onLoadSearchMemberEvent(
      LoadSearchMemberEvent event, Emitter<SearchState> emit) async {}
}
