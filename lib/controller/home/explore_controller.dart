import 'package:get/get.dart';
import 'package:project_one/models/user_model.dart';
import 'package:project_one/repositories/user/user_repository.dart';

class ExploreController extends GetxController {
  final UserRepository _userRep = UserRepository();
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
