import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/home/center_home_controller.dart';
import 'package:project_one/view/widgets/my_app_bar_widget.dart';
import '../../widgets/app_nav_bar.dart';

class CenterHomeScreen extends StatelessWidget {
  const CenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CenterHomeController>(
        init: CenterHomeController(),
        builder: (ctr) => Scaffold(
            bottomNavigationBar: myNavBar(context),
            appBar: (ctr.selectedIndex == 00) ? myAppBar(context) : null,
            body: ctr.widgetOptions[ctr.selectedIndex]));
  }
}
