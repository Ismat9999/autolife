import 'package:autolife/presantation/blocs/navigator_bloc/navigator_bloc.dart';
import 'package:autolife/presantation/blocs/navigator_bloc/navigator_state.dart';
import 'package:autolife/presantation/widgets/views/view_of_navigaor_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../blocs/navigator_bloc/navigator_event.dart';
import '../../widgets/items/item_of_navigator_filtr.dart';


class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  late NavigatorBloc navigatorBloc;

  @override
  void initState() {
    super.initState();
    navigatorBloc= context.read<NavigatorBloc>();
    navigatorBloc.add(NavigatorInit());
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorBloc,NavigatorSearchState>(
      listener: (context, state){},
      builder: (context,state){
        if(state is NavigatorLoadingState){
          return viewOfNavigatorPage(context,navigatorBloc,true);
        }
        if(state is NavigatorSuccsesState){
          return viewOfNavigatorPage(context, navigatorBloc,false);
        }
        return viewOfNavigatorPage(context, navigatorBloc,true);
      },
    );
  }
}
