import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_three/place_description_controller.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class PlaceDescriptionScreen extends StatelessWidget {
  const PlaceDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<PlaceDescriptionController>(
          init: PlaceDescriptionController(),
          builder: (ctr) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const HeadlinePageTitle(
                      title:
                          'Now. let\'s give your place a title & description',
                      subTitle:
                          'Short titles work best. have fun with it - you can always change it later\nShare what makes your place special.'),
                  const SizedBox(height: 30),
                  TextField(
                    controller: ctr.titleController,
                    onChanged: ctr.onChangedtitle,
                    maxLength: 32,
                    style: textTheme.displaySmall,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.8)),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () => ctr.titleController.clear()),
                      border: const OutlineInputBorder(),
                      helperMaxLines: 2,
                      helperStyle: textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLength: 500,
                    onChanged: ctr.onChangedDescription,
                    controller: ctr.descriptionController,
                    maxLines: 10,
                    style: textTheme.displaySmall,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText:
                          'You\'ll always remember your time at this unique place to stay.',
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.8)),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () => ctr.descriptionController.clear()),
                      border: const OutlineInputBorder(),
                      helperMaxLines: 2,
                      helperStyle: textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
