import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/services/printer.dart';
import 'package:project_one/view/screens/center_screens/explore_screens/explore_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/profile_screen.dart';
import 'package:project_one/view/screens/center_screens/wishlist_screen/wishlist_screen.dart';
import 'package:project_one/view/screens/login_screens/signin_screen.dart';

class CenterHomeController extends GetxController {
  int selectedTapViewIndex = 0;

  final List<Map<String, dynamic>> placesTypes = [
    {'type': 'Hotel', 'icon': Icons.hotel},
    {'type': 'Apartment', 'icon': Icons.apartment},
    {'type': 'House', 'icon': Icons.house},
    {'type': 'Villa', 'icon': Icons.villa},
    {'type': 'Chalet', 'icon': Icons.chalet},
    {'type': 'Yacht', 'icon': Icons.abc},
    {'type': 'Boat', 'icon': Icons.abc},
  ];
  int selectedIndex = 0;

  List<Widget> widgetOptions = [
    const ExploreScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  void navTabBar(int index) {
    selectedTapViewIndex = index;
    update();
  }

  void navigateBottomBar(BuildContext context, int index) async {
    if (index == widgetOptions.length - 1) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Printer.print('User is currently signed out!');
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => const SignInScreen());
        } else {
          selectedIndex = index;
          Printer.print('User is signed in!');
        }
      });
    } else {
      selectedIndex = index;
    }
    update();
  }
}
