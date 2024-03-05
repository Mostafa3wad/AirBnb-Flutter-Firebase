import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_one/choose_type_controller.dart';

class ChoosePlaceTypeScreen extends StatelessWidget {
  const ChoosePlaceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Which of these best describes your place?',
                    style: textTheme.headlineLarge,
                  )),
              GetBuilder<ChooseTypeController>(
                  init: ChooseTypeController(),
                  builder: (ctr) {
                    return GridView.builder(
                        itemCount: ctr.typesOfPlaces.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                ctr.choosePLase(index);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.black87,
                                        width: ctr.itemSelectCount == index
                                            ? 2
                                            : 0.6,
                                      )),
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          ctr.typesOfPlaces[index][1],
                                          size: 30,
                                        ),
                                        Text(ctr.typesOfPlaces[index][0])
                                      ],
                                    ),
                                  )),
                            ));
                  }),
            ],
          ),
        ));
  }
}
