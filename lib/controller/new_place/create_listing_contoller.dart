import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/controller/new_place/step_one/choose_location_controller.dart';
import 'package:project_one/controller/new_place/step_three/guests_types_controller.dart';
import 'package:project_one/controller/new_place/step_tow/place_offers_contoller.dart';
import 'package:project_one/models/location.dart';
import 'package:project_one/util/printer.dart';
import 'package:project_one/view/screens/center_screens/center_home_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_one/add_basics_information_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_one/choose_location_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_one/choose_place_type_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_one/step_one_title.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_two/add_some_photo.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_two/palce_description_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_two/place_offers_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_two/step_two_title.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_three/discounts_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_three/guest_types_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_three/set_price_screen.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/steps_of_create_place/step_three/step_three_title.dart';
import 'package:project_one/view/screens/center_screens/profile_screens/new_listing_screens/successfuly_screen.dart';
import 'package:project_one/view/widgets/addres_bottom_sheet.dart';

class CreateListingController extends GetxController {
  RxString placeType = ''.obs;

  LocationModel? locationModel;
  RxString country = ''.obs;
  RxString city = ''.obs;
  RxString street = ''.obs;

  RxInt guests = 4.obs;
  RxInt bedrooms = 1.obs;
  RxInt beds = 1.obs;
  RxInt bathroom = 1.obs;

  RxList<String> placeOffers = <String>[].obs;

  RxList<XFile?> images = <XFile>[].obs;

  RxBool isGuest = false.obs;

  RxInt price = 50.obs;

  RxString title = ''.obs;
  RxString decoration = ''.obs;

  RxInt primaryDiscount = 20.obs;
  RxInt weeklyDiscount = 20.obs;
  RxInt monthlyDiscount = 30.obs;

  RxInt currentScreenIndex = 0.obs;
  RxBool isDataComplete = false.obs;
  RxDouble progressValue = 0.0.obs;

  RxList<Widget> screens = <Widget>[
    // Step One
    const StepOneTitleScreen(),
    const ChoosePlaceTypeScreen(),
    const ChooseLocationScreen(),
    const AddBasicInformationScreen(),

    // Step two
    const StepTwoTitleScreen(),
    const PlaceOffersScreen(),
    const AddSomePhotoScreen(),
    const PlaceDescriptionScreen(),

    //Step Three
    const StepThreeTitleScreen(),
    const GuestsTypesScreen(),
    const SetPriceScreen(),
    const DiscountScreen(),
  ].obs;

  void nextStep() {
    // If the place data is completed
    if (currentScreenIndex.value == screens.length - 1) {
      Get.to(() => const SuccessfulScreen());
    }
    if (checkIfFieldsAreFull() && currentScreenIndex.value < screens.length) {
      currentScreenIndex.value++;
      Printer.print(currentScreenIndex.value);
      progressValue.value += 1 / screens.length;
    }
  }

  bool checkIfFieldsAreFull() {
    switch (currentScreenIndex.value) {
      case 0: //StepOneTitleScreen()
        return true;

      case 1: //ChoosePlaceTypeScreen()
        return placeType.value.isNotEmpty;

      case 2: // ChooseLocationScreen()
        final ChooseLocationController chooseLocationController =
            Get.put(ChooseLocationController());
        bool isCompleted = (chooseLocationController.marker.isNotEmpty &&
            chooseLocationController.cityController.value.text.isNotEmpty &&
            chooseLocationController.countryController.value.text.isNotEmpty &&
            chooseLocationController.streetController.value.text.isNotEmpty);
        if (!isCompleted) Get.bottomSheet(const AddressBottomShert());
        return isCompleted;

      case 3: // AddBasicInformationScreen()
        return true;

      case 4: // StepTowTitleScreen()
        return true;

      case 5: // PlaceOffersScreen()
        final PlaceOffersController chooseTypeViewModel = Get.find();
        return chooseTypeViewModel.isCompleted;

      case 6: // AddSomePhotoScreen()
        return images.value.length >= 5;

      case 7: // PlaceDescriptionScreen()
        return title.value.isNotEmpty && title.value.isNotEmpty;

      case 8: // StepThreeTitleScreen()
        return true;

      case 9: //GuestsTypesScreen
        final GuestsTypesController guestsTypesController = Get.find();
        isGuest.value = guestsTypesController.isGuest.value;
        return true;

      case 10: //SetPriceScreen
        return price.value > 0;

      case 11: //DiscountScreen
        return false;

      default:
        return false;
    }
  }

  void back() {
    if (currentScreenIndex.value > 0) {
      currentScreenIndex.value--;
      progressValue.value -= 1 / screens.length;
    } else if (currentScreenIndex.value == 0) {
      Get.offAll(() => const CenterHomeScreen());
      Get.delete<CreateListingController>();
    } else {
      Get.back();
    }
  }
}
