import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/repositories/piker_image/image_picker_repositorie.dart';

class AddSomePhotoController extends GetxController {
  ImagePickerRepositorie imagePickerRep = ImagePickerRepositorie();
  CreateListingController createListingController = Get.find();

  List<XFile?> images = <XFile>[];

  Future<void> getImages() async {
    images.addAll(await imagePickerRep.pickImages());
    createListingController.images.addAll(images);
    update();
  }

  Future<void> getPhoto() async {
    XFile? pickedImage = await imagePickerRep.pickPhoto();
    if (pickedImage != null) {
      images.add(pickedImage);
      createListingController.images.addAll(images);
    }
    update();
  }

  void removeImage(int index) {
    images.removeAt(index);
    createListingController.images.addAll(images);
    update();
  }
}
