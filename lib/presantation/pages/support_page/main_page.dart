import 'package:autolife/presantation/blocs/main_bloc/auto_scrool_bloc.dart';
import 'package:autolife/presantation/blocs/main_bloc/auto_scrool_event.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_bloc.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_state.dart';
import 'package:autolife/presantation/widgets/views/view_of_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc mainBloc;
  late AutoScrollBloc autoScrollBloc;


  @override
  void initState() {
    super.initState();
    mainBloc = context.read<MainBloc>();
    autoScrollBloc=context.read<AutoScrollBloc>();
    autoScrollBloc.startAutoScroll(context);

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return viewOfmainPage(context, mainBloc,autoScrollBloc, true);
      },
    );
  }
}
