import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/auth_controller.dart';
import 'package:project_one/view/widgets/textfield_widget.dart';

class ConfirmNumberScreen extends StatelessWidget {
  const ConfirmNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GetX<AuthController>(
        init: AuthController(),
        builder: (ctr) {
          return AnimatedContainer(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20), left: Radius.circular(20))),
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(12.0),
              height: ctr.isSignWithPhone.value
                  ? Get.height * 0.8
                  : Get.height * 0.7,
              child: Column(
                children: [
                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        'Confirm the number',
                        style: textTheme.headlineMedium,
                      ),
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.clear,
                            size: 22,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  // TextField for Confirm Number
                  MyTextField(
                      textInputType: TextInputType.number,
                      controller: ctr.vrifyCodeController,
                      hintText: 'Phone number'),
                  //  TextField for Phone Number
                  const SizedBox(height: 20),
                  // Continue Buttom for Phone Number

                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Didn\'t receive an SMS?. Resend')),
                  const SizedBox(height: 60),

                  // --------------------

                  Container(
                    color: Colors.grey,
                    width: Get.width * 0.9,
                    height: 1,
                  ),

                  const SizedBox(height: 30),

                  MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    height: 50,
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      ctr.verificationSmsCode(context);
                    },
                    child: Text(
                      'Continue',
                      style: textTheme.displayMedium,
                    ),
                  ),
                ],
              ));
        });
  }
}
