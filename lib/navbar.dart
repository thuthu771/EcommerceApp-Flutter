import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_ui/seeall1.dart';
import 'package:online_ui/shopping.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentNavBarExample extends StatelessWidget {
  PersistentNavBarExample({super.key});

  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [onlineshop(), seeall(), Container()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.settings),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.black),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.grey,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(9),
          colorBehindNavBar: Colors.purpleAccent),
      itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 220), curve: Curves.bounceOut),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.bounceOut,
        duration: Duration(milliseconds: 220),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
