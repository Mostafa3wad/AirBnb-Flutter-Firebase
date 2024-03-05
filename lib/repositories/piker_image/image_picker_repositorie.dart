import 'package:image_picker/image_picker.dart';

class ImagePickerRepositorie {
  List<XFile>? selectedImages;

  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    return XFile(pickedFile!.path);
  }

  Future<List<XFile>> pickImages() async {
    return await _imagePicker.pickMultiImage(
      imageQuality: 100,
    );
  }

  Future<XFile?> pickPhoto() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 100);
      return XFile(pickedFile!.path);
    } catch (e) {
      return null;
    }
  }
}
