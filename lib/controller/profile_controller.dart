import 'dart:io';
import 'package:get/get.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/repositories/user/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/services/printer.dart';

class ProfileController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final ImagePicker _imagePicker = ImagePicker();

  File? _selectedImage;

  UserModel? userModel;

  @override
  void onInit() async {
    super.onInit();
    userModel = await _userRepository.getUserData();
    update();
  }

  Future<void> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      update();
    }
  }

  Future<void> updateProfileImage() async {
    if (_selectedImage != null) {
      await _userRepository.updateUserProfileImage(_selectedImage!);
      Printer.showSnackbarError(
          title: 'Done', message: 'User photo updated successfully');
    }
  }
}
