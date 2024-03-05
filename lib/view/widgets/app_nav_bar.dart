import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/config/color.dart';
import '../../controller/home/center_home_controller.dart';

Widget myNavBar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColor.appBlack.withOpacity(0.1),
          blurRadius: 1.0,
          spreadRadius: 1.0,
          offset: const Offset(0.0, -1.0),
        )
      ],
    ),
    child: NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.appRed),
        ),
      ),
      child: GetBuilder<CenterHomeController>(
        init: CenterHomeController(),
        builder: (ctr) => NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (index) =>
              ctr.navigateBottomBar(context, index),
          indicatorColor: Colors.transparent,
          selectedIndex: ctr.selectedIndex,
          height: 56.0,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.search_outlined),
              label: 'Explore',
              selectedIcon: Icon(
                Icons.search,
                color: AppColor.appRed,
              ),
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
              selectedIcon: Icon(
                Icons.favorite,
                color: AppColor.appRed,
              ),
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_outline),
              label: 'Log in',
              selectedIcon: Icon(
                Icons.person,
                color: AppColor.appRed,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
