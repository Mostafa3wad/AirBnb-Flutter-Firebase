import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/auth_controller.dart';
import 'package:project_one/view/widgets/continue_button.dart';
import 'package:project_one/view/widgets/dividing_line.dart';
import 'package:project_one/view/widgets/mybutton.dart';
import 'package:project_one/view/widgets/textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (ctr) {
          return AnimatedContainer(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20), left: Radius.circular(20))),
              duration: const Duration(milliseconds: 200),
              height: ctr.isSignWithPhone.value
                  ? Get.height * 0.8
                  : Get.height * 0.75,
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 30),
                        Text(
                          'Log in or subscribe',
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
                  ),
                  const DividingLine(),
                  //  TextField for Phone Number
                  if (ctr.isSignWithPhone.value)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          child: MyButton(
                            onPressed: () {},
                            widget: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Region/Country',
                                    style: textTheme.labelSmall,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Egypt(+20)',
                                    style: textTheme.bodySmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //  TextField for Email
                        if (ctr.isSignWithPhone.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: MyTextField(
                                controller: ctr.phoneController,
                                textInputType: TextInputType.phone,
                                helperText:
                                    'You will receive or we will send a text message to confirm your number',
                                hintText: 'Phone number'),
                          ),
                      ],
                    ),
                  //  TextField for Email
                  if (ctr.isSignWithEmail.value)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          child: MyTextField(
                              controller: ctr.emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: 'Email'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 12, right: 12),
                          child: MyTextField(
                              controller: ctr.passwordController,
                              textInputType: TextInputType.visiblePassword,
                              hintText: 'password'),
                        ),
                      ],
                    ),

                  // Continue Buttom
                  //It is used to verify the phone number and email if it is available or not
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 12, right: 12),
                    child: ContinueButton(
                        onPressed: () {
                          if (ctr.isSignWithPhone.value) {
                            ctr.sendSmsCode(context);
                          }
                          if (ctr.isSignWithEmail.value) {
                            ctr.signWithEmailAndPassword(context);
                          }
                        },
                        text: 'Continue'),
                  ),
                  // ---------or-----------
                  const DividingLine(withOr: true),
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
                  // Log in with Email
                  if (!ctr.isSignWithEmail.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MyButton(
                        onPressed: ctr.showEmailField,
                        text: 'Continue with email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                  // show  phone field
                  if (!ctr.isSignWithPhone.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MyButton(
                        onPressed: ctr.showPhoneField,
                        text: 'Continue with phone',
                        icon: Icons.phone_android,
                        color: Colors.blue,
                      ),
                    ),
                  // For Regaster
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                            style: textTheme.headlineSmall),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: textTheme.titleMedium,
                            ))
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
