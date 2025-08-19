import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/presantation/blocs/home/home_bloc.dart';
import 'package:autolife/presantation/blocs/home/home_state.dart';
import 'package:autolife/presantation/blocs/main_bloc/main_bloc.dart';
import 'package:autolife/presantation/blocs/search_bloc/search_bloc.dart';
import 'package:autolife/presantation/blocs/upload_bloc/upload_bloc.dart';
import 'package:autolife/presantation/pages/support_page/favorite_page.dart';
import 'package:autolife/presantation/pages/support_page/main_page.dart';
import 'package:autolife/presantation/pages/support_page/search_page.dart';
import 'package:autolife/presantation/pages/support_page/upload_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
                create: (context) => UploadBloc(),
                child: const UploadPage(),
              ),
              BlocProvider(
                create: (context) => UploadBloc(),
                child: const UploadPage(),
              ),
              BlocProvider(
                create: (context) => UploadBloc(),
                child: const UploadPage(),
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
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
