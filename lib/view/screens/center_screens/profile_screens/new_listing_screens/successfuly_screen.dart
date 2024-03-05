import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/controller/new_place/successfuly_controller.dart';
import 'package:project_one/view/widgets/continue_button.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: GetBuilder<SuccessfulyController>(
          init: SuccessfulyController(),
          builder: (ctr) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              child: ContinueButton(
                onPressed: () {
                  ctr.addNewPlace();
                },
                text: 'publish',
              ),
            );
          }),
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              GetX<CreateListingController>(
                  init: CreateListingController(),
                  builder: (ctr) {
                    return Stack(
                      children: [
                        Image.file(
                          File(ctr.images[0]!.path),
                          fit: BoxFit.cover,
                          height: Get.height * 0.55,
                          width: Get.width,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black,
                                  Colors.black45.withOpacity(.7),
                                  const Color.fromARGB(31, 73, 71, 71)
                                      .withOpacity(.1),
                                ],
                                    end: Alignment.topCenter,
                                    begin: Alignment.bottomCenter)),
                          ),
                        ),
                      ],
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text('Congratulation.',
                            style: textTheme.headlineMedium!
                                .copyWith(color: Colors.white))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'From one Host to another- welcome aboard. Thank you for sharing your home and helping to create incredible experiences for our guests.',
                        style: textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
