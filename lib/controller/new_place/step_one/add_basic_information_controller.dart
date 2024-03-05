import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';

class BasicInformationController extends GetxController {
  int guests = 4;
  int bedrooms = 1;
  int beds = 1;
  int bathroom = 1;
  final CreateListingController createListingController = Get.find();

  void guestsIncrement(int condition) {
    if (guests != 1 || !condition.isNegative) {
      guests += condition;
      createListingController.guests.value = guests;
      update();
    }
  }

  void bedroomsIncrement(int condition) {
    if (bedrooms != 0 || !condition.isNegative) {
      bedrooms += condition;
      createListingController.bedrooms.value = bedrooms;
      update();
    }
  }

  void bedsIncrement(int condition) {
    if (beds != 1 || !condition.isNegative) {
      beds += condition;
      createListingController.beds.value = beds;
      update();
    }
  }

  void bathroomIncrement(int condition) {
    if (bathroom != 1 || !condition.isNegative) {
      bathroom += condition;
      createListingController.bathroom.value = bathroom;
      update();
    }
  }
}
