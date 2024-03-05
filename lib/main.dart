import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'shared/theme/theme.dart';
import '/view/screens/center_screens/center_home_screen.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeApp(),
      home: const CenterHomeScreen(),
    );
  }
}
