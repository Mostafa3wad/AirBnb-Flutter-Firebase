import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/auth_controller.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/view/widgets/dividing_line.dart';
import 'package:project_one/view/widgets/mybutton.dart';

class EmailAlreadyInUseScreen extends StatelessWidget {
  const EmailAlreadyInUseScreen({super.key, required this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (ctr) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(20), left: Radius.circular(20))),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.clear,
                      size: 22,
                    )),
                Text(
                  'Account exists',
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(width: 30),
              ],
            ),
            const DividingLine(),
            const SizedBox(height: 30),
            const Text('Looks like you already have an account.'),
            const Text('Please login instead.'),
            const SizedBox(height: 30),
            Text(userModel!.firstName!),
            Text(userModel!.email!),
            // loin with Gmail
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: MyButton(
                onPressed: () {
                  ctr.loginWithGoogle(context);
                },
                text: 'Continue with gmail',
                icon: Icons.g_mobiledata_outlined,
                color: const Color.fromARGB(255, 255, 102, 0),
              ),
            ),
            const SizedBox(height: 30),

            InkWell(
              onTap: () => Get.back(),
              child: const Text(
                'log in with a different account',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
