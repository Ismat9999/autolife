import 'package:autolife/core/constants/constants.dart';
import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/presantation/blocs/home/home_bloc.dart';
import 'package:autolife/presantation/blocs/home/home_state.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_bloc.dart';
import 'package:autolife/presantation/blocs/navigator_bloc/navigator_bloc.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_bloc.dart';
import 'package:autolife/presantation/pages/support_page/main_page.dart';
import 'package:autolife/presantation/pages/support_page/navigator_page.dart';
import 'package:autolife/presantation/pages/support_page/search_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc= context.read<HomeBloc>();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: Image(image: AssetImage("assets/images/33.png"),fit: BoxFit.contain,),
                ),
                SizedBox(width: 30,),
                // Text("Bosh sahifa",style: TextStyle(fontFamily: Constants.exo,color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon:Icon(EvaIcons.settings,color: Colors.white,),
              ),
            ],
          ),
          body: PageView(
            onPageChanged: (index) {
              homeBloc.onPageViewChange(index);
            },
            controller: pageController,
            children: [
              BlocProvider(
                create: (context) => MainBloc(),
                child: const MainPage(),
              ),
              BlocProvider(
                create: (context) => SearchBloc(),
                child: const SearchPage(),
              ),
              BlocProvider(
                create: (context) => NavigatorBloc(),
                child: const NavigatorPage(),
              ),
              BlocProvider(
                create: (context) => SearchBloc(),
                child: const SearchPage(),
              ),
            ],
          ),
          bottomNavigationBar: CupertinoTabBar(
            onTap: (index) {
              homeBloc.onBottomChange(index);
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            currentIndex: homeBloc.currentTap,
            backgroundColor: AppColors.blackColor,
            activeColor: AppColors.whiteColor,
            items: [
              BottomNavigationBarItem(
                label: "Bosh Sahifa",
                activeIcon: Icon(EvaIcons.home),
                icon: Icon(
                  EvaIcons.homeOutline,
                  size: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: "Qidiruv",
                activeIcon: Icon(EvaIcons.search),
                icon: Icon(
                  EvaIcons.searchOutline,
                  size: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: "Joylashuv",
                activeIcon: Icon(LucideIcons.navigation),
                icon: Icon(
                  LucideIcons.navigation_2_off,
                  size: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: "Kabinet",
                activeIcon: Icon(EvaIcons.person),
                icon: Icon(
                  EvaIcons.personOutline,
                  size: 25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}