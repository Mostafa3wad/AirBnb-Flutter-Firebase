import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_tow/add_some_photo_contoller.dart';
import 'package:project_one/view/widgets/headline_page.dart';
import 'package:project_one/view/widgets/mybutton.dart';

class AddSomePhotoScreen extends StatelessWidget {
  const AddSomePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GetBuilder<AddSomePhotoController>(
          init: AddSomePhotoController(),
          builder: (ctr) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const HeadlinePageTitle(
                      title: 'Add some photo of your Place ',
                      subTitle:
                          'You\'ll need 5 photos to get started. You can add more of make changes later'),
                  const SizedBox(height: 30),
                  MyButton(
                    onPressed: () async {
                      await ctr.getImages();
                    },
                    height: 65,
                    widget: Row(children: [
                      const Icon(
                        Icons.add,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Add photo',
                            style: textTheme.displayLarge,
                          ))
                    ]),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    onPressed: () async => ctr.getPhoto(),
                    height: 65,
                    widget: Row(children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Take new photo',
                            style: textTheme.displayLarge,
                          ))
                    ]),
                  ),
                  const SizedBox(height: 30),
                  if (ctr.images.isNotEmpty)
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ctr.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) => Stack(
                        children: [
                          Image.file(
                            File(ctr.images[index]!.path),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 150,
                          ),
                          Positioned(
                              top: -5,
                              right: -24,
                              child: MaterialButton(
                                height: 25,
                                color: Colors.white.withOpacity(0.85),
                                shape: const CircleBorder(),
                                onPressed: () => ctr.removeImage(index),
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),
                    )
                ],
              ),
            );
          }),
    );
  }
}
