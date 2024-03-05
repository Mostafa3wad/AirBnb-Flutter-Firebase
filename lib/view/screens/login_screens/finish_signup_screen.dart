import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/auth_controller.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/view/widgets/continue_button.dart';
import 'package:project_one/view/widgets/open_date_piker.dart';
import 'package:project_one/view/widgets/textfield_widget.dart';
import 'package:project_one/view/widgets/mybutton.dart';

class FinishSignUpScreen extends StatelessWidget {
  const FinishSignUpScreen({super.key, required this.dateComeFrom});

  final String? dateComeFrom;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (ctr) => SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(20), left: Radius.circular(20))),
          padding: const EdgeInsets.all(12.0),
          height: Get.height * 0.9,
          child: Column(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      'Finish signing up',
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
              MyTextField(
                controller: ctr.firstNameController,
                hintText: 'First Name',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 5),
              MyTextField(
                controller: ctr.laseNameController,
                hintText: 'Last Name',
                textInputType: TextInputType.name,
                helperText:
                    'Make sure it matches the name on your government id.',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: MyButton(
                  onPressed: () => openDatePicker(
                    context,
                    onSubmit: (index) {
                      ctr.birthday = index;
                    },
                  ),
                  widget: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      ctr.birthday == null
                          ? 'Birthday(dd/mm/yyyy)'
                          : '${ctr.birthday!.day}/${ctr.birthday!.month}/${ctr.birthday!.year}',
                      style: ctr.birthday == null
                          ? textTheme.labelMedium
                          : textTheme.displaySmall,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'to sign up, you need to be at least 18. your birthday won\'tbe shared with other people who use Airbnb',
                    style: textTheme.labelSmall,
                  ),
                ),
              ),
              MyTextField(
                controller: ctr.emailController,
                isEnabled: dateComeFrom != 'gmail',
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
                helperText: 'We\'ll email you trip confirmations and receipts',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'this info come from $dateComeFrom',
                    style: textTheme.labelSmall,
                  ),
                ),
              ),

              ContinueButton(
                onPressed: () {
                  ctr.addUser(
                      UserModel(
                          firstName: ctr.firstNameController.text,
                          lastName: ctr.laseNameController.text,
                          birthday: Timestamp.fromDate(ctr.birthday!),
                          email: ctr.emailController.text,
                          phone: dateComeFrom == 'phone'
                              ? '+20${ctr.phoneController.text.toString()}'
                              : null,
                          userID: FirebaseAuth.instance.currentUser!.uid),
                      context);
                },
                text: 'Continue',
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
