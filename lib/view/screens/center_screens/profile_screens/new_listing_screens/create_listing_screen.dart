import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';

class CreateListingScreen extends StatelessWidget {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetX<CreateListingController>(
      init: CreateListingController(),
      builder: (ctr) => Scaffold(
        body: ctr.screens[ctr.currentScreenIndex.value],
        bottomNavigationBar: Container(
          color: Colors.white,
          width: Get.size.width,
          height: 95,
          child: Column(children: [
            Stack(
              children: [
                LinearProgressIndicator(
                  value: ctr.progressValue.value,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
                Positioned(
                    left: Get.size.width / 3,
                    child:
                        Container(color: Colors.white, height: 10, width: 10)),
                Positioned(
                    right: Get.size.width / 3,
                    child:
                        Container(color: Colors.white, height: 10, width: 10)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ctr.back,
                    child: const Text(
                      'Back',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  MaterialButton(
                    splashColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    height: 50,
                    highlightColor:
                        ctr.isDataComplete.value ? null : Colors.black,
                    color: Colors.black,
                    onPressed: ctr.nextStep,
                    child: Text(
                      'Next',
                      style: textTheme.displayMedium!.copyWith(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
