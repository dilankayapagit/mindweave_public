import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindweave/presentation/prompt_screen/prompt_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/presentation/Home_page/home_page.dart';

import '../profile_screen/profile_screen.dart';
import 'controller/discover_container_controller.dart';

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var discoverContainerController = Get.find<BottomNavController>();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      PromptScreen(),
      ProfileScreen(),
    ];
  }

  Color colorInactive = Color(0xffC2A0D5);
  Color colorActive = Color(0xffCB1ECE);
  Color brown = Color(0Xff131212);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.house,
        ),
        title: ("Home"),
        activeColorPrimary: colorActive,
        inactiveColorPrimary: colorInactive,
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: FaIcon(
            FontAwesomeIcons.penNib,
            color: colorInactive,
          ),
        ),
        activeColorPrimary: brown,
        inactiveColorPrimary: colorActive,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(
          FontAwesomeIcons.user,
        ),
        title: ("Profile"),
        activeColorPrimary: colorActive,
        inactiveColorPrimary: colorInactive,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: PersistentTabView(
          context,
          navBarHeight: 65,
          controller: discoverContainerController.persistentTabController.value,
          screens: _buildScreens(),
          items: _navBarsItems(),

          decoration: NavBarDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                10,
              ),
              topRight: Radius.circular(
                10,
              ),
            ), // colorBehindNavBar: Colors.white,
            gradient: LinearGradient(
              begin: Alignment(
                0.05,
                -0.19,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                ColorConstant.deepPurple900,
                ColorConstant.purple800,
              ],
            ),
          ),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Default is Colors.white.
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      ),
    );
  }
}
