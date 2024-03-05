import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/shared/config/color.dart';
import 'package:project_one/controller/auth_controller.dart';
import 'package:project_one/controller/profile_controller.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/lets_go_screen.dart';
import 'package:project_one/view/widgets/dividing_line.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        color: AppColor.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 40),
            //title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: textTheme.headlineLarge,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_outlined))
                ],
              ),
            ),
            // Edit Photo
            GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (ctr) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: AppColor.grey1,
                              radius: 33.0,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: -7,
                                    right: -8.5,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.person,
                                        color: AppColor.grey2,
                                        size: 68,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (ctr.userModel != null)
                                    Text(
                                      ctr.userModel!.firstName!,
                                      style: textTheme.displayLarge,
                                    ),
                                  Text(
                                    'Edit photo',
                                    style: textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 34,
                              color: Colors.black87,
                            ))
                      ],
                    ),
                  );
                }),
            const DividingLine(),
            // Add Place
            InkWell(
              onTap: () => Get.to(() => const LestGoScreen()),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Airbnb your place',
                                style: textTheme.displayLarge,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'it\'s simple to get set up and start earing.',
                                style: textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/img/icons/home.png',
                            height: 70,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: textTheme.displayLarge,
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Personal information',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.person_2_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
                ListTile(
                  title: Text(
                    'login & security',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.security_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
                ListTile(
                  title: Text(
                    'Accessibility',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.settings_accessibility_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
                ListTile(
                  title: Text(
                    'Notifications',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.notifications_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
                ListTile(
                  title: Text(
                    'Privacy',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.privacy_tip_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: textTheme.displayLarge,
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Terms of service',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.collections_bookmark),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
                ListTile(
                  title: Text(
                    'Privacy Policy',
                    style: textTheme.bodyMedium,
                  ),
                  leading: const Icon(Icons.security_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                const DividingLine(),
              ],
            ),

            const SizedBox(height: 40),
            GetBuilder<AuthController>(
                init: AuthController(),
                builder: (ctr) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: ctr.logout,
                      child: const Text(
                        'Log out',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  );
                })
          ]),
        ));
  }
}
