import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_three/guests_types_controller.dart';
import 'package:project_one/view/widgets/check_box.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class GuestsTypesScreen extends StatelessWidget {
  const GuestsTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<GuestsTypesController>(
        init: GuestsTypesController(),
        builder: (ctr) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const HeadlinePageTitle(
                    title: 'Choose who to welcome for your first reservation',
                    subTitle:
                        'After your first guest, anyone can book your place.'),
                CheskBoxWidget(
                    title: 'Any Airbnb guest',
                    subTitle:
                        'Get reservations faster when you welcome anyone from the Airbnb community.',
                    value: ctr.isGuest.value,
                    onChanged: ctr.onChangedToAnyGuest),
                const SizedBox(height: 20),
                CheskBoxWidget(
                    title: 'An experienced guest',
                    subTitle:
                        'For your first guest, welcome someone with a good track record on Airbnb who can offer tips for how to be a great Host.',
                    value: !ctr.isGuest.value,
                    onChanged: ctr.onChanged),
              ],
            ),
          );
        });
  }
}
