import 'package:get/get.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/services/user/user_service.dart';

class ExploreController extends GetxController {
  final UserService _userRep = UserService();
  UserModel? userModel;

  @override
  void onInit() async {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    userModel = await _userRep.getUserData();
    update();
  }

  void addFavioretPlace(String idPlaces, bool value) {
    // add palace in wishlist or delete
    _userRep.addpalceInWishlist(idPlaces, value);
    // refresh user data
    if (value) {
      userModel!.wishlist!.removeAt(userModel!.wishlist!.indexOf(idPlaces));
    } else {
      userModel!.wishlist!.add(idPlaces);
    }
    update();
  }
}
