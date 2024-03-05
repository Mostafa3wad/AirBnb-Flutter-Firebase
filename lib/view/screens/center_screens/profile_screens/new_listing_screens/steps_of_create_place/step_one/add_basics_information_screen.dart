import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_one/add_basic_information_controller.dart';
import 'package:project_one/view/widgets/circleIcon_button.dart';
import 'package:project_one/view/widgets/dividing_line.dart';

class AddBasicInformationScreen extends StatelessWidget {
  const AddBasicInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: GetBuilder<BasicInformationController>(
          init: BasicInformationController(),
          builder: (ctr) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 90),
                  Text(
                    'Share some basics about your place',
                    style: textTheme.headlineLarge!.copyWith(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You\'ll add more datails later, like bed types.',
                        style: textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Guests'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            CircleIconButton(
                                opacity: ctr.guests == 1 ? 0.3 : 1,
                                onPressed: () => ctr.guestsIncrement(-1),
                                iconData: Icons.remove),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(ctr.guests.toString()),
                            ),
                            CircleIconButton(
                                opacity: 1,
                                onPressed: () => ctr.guestsIncrement(1),
                                iconData: Icons.add),
                          ],
                        ),
                      )
                    ],
                  ),
                  const DividingLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bedrooms'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            CircleIconButton(
                                opacity: ctr.bedrooms == 0 ? 0.3 : 1,
                                onPressed: () => ctr.bedroomsIncrement(-1),
                                iconData: Icons.remove),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(ctr.bedrooms.toString()),
                            ),
                            CircleIconButton(
                                opacity: 1,
                                onPressed: () => ctr.bedroomsIncrement(1),
                                iconData: Icons.add),
                          ],
                        ),
                      )
                    ],
                  ),
                  const DividingLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Beds'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            CircleIconButton(
                                opacity: ctr.beds == 1 ? 0.3 : 1,
                                onPressed: () => ctr.bedsIncrement(-1),
                                iconData: Icons.remove),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(ctr.beds.toString()),
                            ),
                            CircleIconButton(
                                opacity: 1,
                                onPressed: () => ctr.bedsIncrement(1),
                                iconData: Icons.add),
                          ],
                        ),
                      )
                    ],
                  ),
                  const DividingLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Bathroom'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            CircleIconButton(
                                opacity: ctr.bathroom == 1 ? 0.3 : 1,
                                onPressed: () => ctr.bathroomIncrement(-1),
                                iconData: Icons.remove),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(ctr.bathroom.toString()),
                            ),
                            CircleIconButton(
                                opacity: 1,
                                onPressed: () => ctr.bathroomIncrement(1),
                                iconData: Icons.add),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
