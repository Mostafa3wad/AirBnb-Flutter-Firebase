import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/controller/new_place/step_one/choose_location_controller.dart';
import 'package:project_one/models/location.dart';
import 'package:project_one/models/place_model.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/services/firebase/firebase_service.dart';
import 'package:project_one/services/user/user_service.dart';
import 'package:project_one/util/printer.dart';
import 'package:project_one/view/screens/center_screens/center_home_screen.dart';
import 'package:uuid/uuid.dart';

class SuccessfulyController extends GetxController {
  CreateListingController createListingController =
      Get.put(CreateListingController());
  ChooseLocationController chooseLocationController =
      Get.put(ChooseLocationController());
  final FirestorService _firebaseRep = FirestorService();
  final UserService _userRep = UserService();
  UserModel? userModel;
  PlaceModel? placeModel;

  @override
  void onInit() async {
    super.onInit();
    userModel = await _userRep.getUserData();
    update();
  }

  Future<void> addNewPlace() async {
    Get.dialog(
        barrierDismissible: false,
        const Center(child: CircularProgressIndicator()));

    String id = const Uuid().v4();

    List<String> imagesURL = await _firebaseRep.uploadImages(
        images: createListingController.images.value,
        userName: '${userModel!.firstName}${userModel!.lastName}',
        placeId: id);

    Printer.print(imagesURL[0]);

    placeModel = PlaceModel(
        id: id,
        guestsCount: createListingController.guests.value,
        bedroomsCount: createListingController.bedrooms.value,
        bedsCount: createListingController.beds.value,
        bathroomCount: createListingController.bathroom.value,
        placeOffers: createListingController.placeOffers,
        images: imagesURL,
        isHideFromGuests: createListingController.isGuest.value,
        price: createListingController.price.value,
        title: createListingController.title.value,
        decoration: createListingController.decoration.value,
        primaryDiscount: createListingController.primaryDiscount.value,
        weeklyDiscount: createListingController.weeklyDiscount.value,
        monthlyDiscount: createListingController.monthlyDiscount.value,
        placeType: createListingController.placeType.value,
        city: chooseLocationController.cityController.value.text,
        country: chooseLocationController.countryController.value.text,
        street: chooseLocationController.streetController.value.text,
        location: LocationModel.fromJson(
            createListingController.locationModel!.toJson()));

    _firebaseRep.uploadNewPlace(placeModel!);

    Get.back();
    Printer.showSnackbarError(
        title: 'Done', message: 'The place has been uploaded');
    Get.offAll(() => const CenterHomeScreen());
    Get.delete<CreateListingController>();
  }
}
