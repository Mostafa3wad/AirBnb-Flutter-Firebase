import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/shared/config/color.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/create_listing_screen.dart';
import 'package:project_one/view/widgets/continue_button.dart';
import 'package:project_one/view/widgets/dividing_line.dart';

class LestGoScreen extends StatelessWidget {
  const LestGoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.size.height,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'it\'s easy to get started on Airbnb',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1  Tell us about your place',
                                  style: textTheme.displayLarge,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'share some basic info ,like where it is and how many guests can stay.',
                                  style: textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img/icons/home.png',
                              height: 70,
                            ),
                          )
                        ]),
                  ),
                  const DividingLine(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2  Make it stand out',
                                  style: textTheme.displayLarge,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'add 5 or more photos plus a title and description-- we\'ll help you out.',
                                  style: textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img/icons/home.png',
                              height: 70,
                            ),
                          )
                        ]),
                  ),
                  const DividingLine(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '3  Finish up and publish',
                                  style: textTheme.displayLarge,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Choose if you\'d like to start with an experienced guest, set a starting price, and publish your listing.',
                                  style: textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img/icons/home.png',
                              height: 70,
                            ),
                          )
                        ]),
                  ),
                ])),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: ContinueButton(
                onPressed: () {
                  Get.to(() => const CreateListingScreen());
                },
                text: 'Get stated',
                color: AppColor.redColor,
              ))
        ],
      ),
    );
  }
}
