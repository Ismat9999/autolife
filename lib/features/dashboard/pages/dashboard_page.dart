import 'package:autolife/core/theme/app_colors.dart';
import 'package:autolife/features/profile/pages/profile_page.dart';
import 'package:autolife/presantation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _pageController = PageController(initialPage: 0);
  final _navigationController = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    _navigationController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const HomePage( ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Favorite"),
    ),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _navigationController,
              color: AppColors.mainColor,
              showLabel: false,
              notchColor: AppColors.whiteColor,
              removeMargins: false,
              bottomBarWidth: 500,
              kIconSize: 24,
              kBottomRadius: 24,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: AppColors.whiteColor,
                  ),
                  activeItem: Icon(Icons.home, color: AppColors.mainColor),
                  itemLabel: "Home",
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                  ),
                  activeItem: Icon(Icons.search, color: AppColors.mainColor),
                  itemLabel: "search",
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_border,
                    color: AppColors.whiteColor,
                  ),
                  activeItem: Icon(Icons.favorite, color: AppColors.mainColor),
                  itemLabel: "Favorite",
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person_outline,
                    color: AppColors.whiteColor,
                  ),
                  activeItem: Icon(Icons.person, color: AppColors.mainColor),
                  itemLabel: "Profile",
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
