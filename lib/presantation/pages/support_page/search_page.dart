import 'package:autolife/presantation/blocs/search_bloc/search_bloc.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_event.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_state.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/views/view_of_search_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc searchBloc;

  @override
  void initState() {
    super.initState();
    searchBloc =context.read<SearchBloc>();
    searchBloc.add(LoadSearchMemberEvent(keyword: ""));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context,state){},
      builder: (context,state){
         if(state is SearchsLoadingState){
          return viewOfSearchPage(context,searchBloc,true,[]);
        }
        if(state is SearchsSuccsesState){
          return viewOfSearchPage(context, searchBloc,false,state.items);
        }
        return viewOfSearchPage(context, searchBloc,true,[]);
      },
        );
  }
}
