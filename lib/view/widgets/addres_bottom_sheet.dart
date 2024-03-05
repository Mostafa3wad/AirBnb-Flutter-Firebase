import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_one/choose_location_controller.dart';
import 'package:project_one/view/widgets/continue_button.dart';
import 'package:project_one/view/widgets/textfield_widget.dart';

class AddressBottomShert extends StatelessWidget {
  const AddressBottomShert({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ChooseLocationController>(
      builder: (ctr) => Container(
        color: Colors.white,
        height: Get.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: MyTextField(
                    controller: ctr.countryController.value,
                    hintText: 'Country',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: MyTextField(
                    controller: ctr.cityController.value,
                    hintText: 'City',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: MyTextField(
                    controller: ctr.streetController.value,
                    hintText: 'Street',
                  ),
                ),
                ContinueButton(text: 'Continue', onPressed: ctr.getAddress)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
