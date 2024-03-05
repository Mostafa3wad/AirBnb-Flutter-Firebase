import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class StepTwoTitleScreen extends StatelessWidget {
  const StepTwoTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: Get.size.height,
      width: Get.size.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Image.asset(
              'assets/img/icons/home.png',
              height: Get.size.width,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Step 2', style: textTheme.displayLarge)),
                  const HeadlinePageTitle(
                      title: 'Make your place stand out',
                      subTitle:
                          'in this step, you\'ll add some of the amenities your place offers, plus 5 or more photos. then , you\'ll create a title and description.'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
