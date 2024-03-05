// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/repositories/user/user_repository.dart';
import 'package:project_one/services/printer.dart';
import 'package:project_one/view/screens/login_screens/confirm_number_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_one/view/screens/login_screens/email_already_in_use.dart';
import 'package:project_one/view/screens/login_screens/finish_signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController vrifyCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController laseNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  PhoneAuthCredential? credential;

  DateTime? birthday;

  UserModel? _userModel;
  final UserRepository userRepository = UserRepository();

  final RxBool isSignWithPhone = true.obs;
  final RxBool isSignWithEmail = false.obs;
  String? _verificationId;

// Send a message when the phone is logged in
  Future<void> sendSmsCode(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {
          Printer.printError(ex.message.toString());
          Printer.showSnackbarError(
              title: 'Error', message: ex.message.toString());
          update();
        },
        codeSent: (String verificationId, int? reSendToken) {
          Get.back();
          // Show Sms Code
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const ConfirmNumberScreen());
          _verificationId = verificationId;
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: '+20${phoneController.text.toString()}');
  }

// To verify the correct phone number
  void verificationSmsCode(BuildContext context) async {
    //Login With Phone Number
    try {
      credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: vrifyCodeController.text);
      FirebaseAuth.instance.signInWithCredential(credential!);
      // To verify whether this count Available or not
      QuerySnapshot querySnapshot = await users
          .where('phone', isEqualTo: '+20${phoneController.text.toString()}')
          .get();
      if (querySnapshot.size > 0) {
        Printer.printError('the account is Available ');
        FirebaseAuth.instance.signInWithCredential(credential!);
      } else {
        Printer.printError('the account is not Available ');
        Get.back();
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const FinishSignUpScreen(
                  dateComeFrom: 'phone',
                ));
      }

      Get.back();
    } catch (ex) {
      Printer.printError(ex.toString());
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

// Log in using Gmail
  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth.instance.currentUser!.email;

      QuerySnapshot querySnapshot = await users
          .where('email',
              isEqualTo: FirebaseAuth.instance.currentUser!.email.toString())
          .get();

      if (querySnapshot.size == 0) {
        Get.back();
        Get.back();
        emailController.text =
            FirebaseAuth.instance.currentUser!.email.toString();
        firstNameController.text =
            FirebaseAuth.instance.currentUser!.displayName.toString();

        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const FinishSignUpScreen(
                  dateComeFrom: 'gmail',
                ));
      } else {
        Get.back();
      }
    } catch (e) {
      Printer.printError(e.toString());
      Printer.showSnackbarError(title: 'Error', message: e.toString());
    }
  }

  void signWithEmailAndPassword(BuildContext context) async {
    try {
      final isValidEmail = GetUtils.isEmail(emailController.text);
      final isValidPassword =
          GetUtils.isLengthGreaterOrEqual(passwordController.text, 6);

      if (!isValidEmail || !isValidPassword) {
        Printer.printError('Invalid email or password');
        Printer.showSnackbarError(
            title: 'Error', message: 'Invalid email or password');
        return;
      }
      List<String> signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(emailController.text);
      QuerySnapshot querySnapshot =
          await users.where('email', isEqualTo: emailController.text).get();

      if (signInMethods.isNotEmpty && querySnapshot.size > 0) {
        //the Email is there, you can log in
        Printer.print('the Email is there, you can log in');
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          Printer.print("Log In ");
          Get.back();
        });
      } else if (signInMethods.isNotEmpty && querySnapshot.size == 0) {
        Printer.print('the Email is there,But continue recording the data');
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          Printer.print("Log In ");
          Get.back();
        });
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const FinishSignUpScreen(
                  dateComeFrom: 'email',
                ));
      } else {
        // Email not found,
        Printer.print('Email not found');
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          Get.back();
        });
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) =>
                const FinishSignUpScreen(dateComeFrom: 'email'));
      }
    } on FirebaseAuthException catch (e) {
      Printer.printError(e.code);
      if (e.code == 'wrong-password') {
        Printer.printError('wrong password');
        Printer.showSnackbarError(title: 'Error', message: 'wrong password');
      } else if (e.code == 'email-already-in-use') {
        Printer.printError('email already in use');
        _userModel = await userRepository.getUserByEmail(emailController.text);

        showModalBottomSheet(
            context: context,
            builder: (context) =>
                EmailAlreadyInUseScreen(userModel: _userModel));
      } else {
        Printer.printError('an error occurred: ${e.message}');
      }
    }
  }

  void showEmailField() {
    isSignWithPhone.value = false;
    isSignWithEmail.value = true;
    update();
  }

  void showPhoneField() {
    isSignWithPhone.value = true;
    isSignWithEmail.value = false;
    update();
  }

  Future<void> addUser(UserModel user, BuildContext context) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    return users.doc(uid).set(user.toMap()).then((value) {
      Printer.print("User Added");
      Get.back();
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.back();
        Get.snackbar(
          'Done',
          'Hi ${firstNameController.text}',
          backgroundColor: Colors.grey.withOpacity(0.6),
        );
      });
    }).catchError((error) {
      Printer.printError(error.message.toString());
      Printer.showSnackbarError(
          title: 'Error', message: error.message.toString());
    });
  }
}
