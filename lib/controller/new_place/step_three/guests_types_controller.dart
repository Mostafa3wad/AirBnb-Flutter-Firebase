import 'package:get/get.dart';

class GuestsTypesController extends GetxController {
  RxBool isGuest = false.obs;

  void onChangedToAnyGuest(bool value) => isGuest.value = value;

  void onChanged(bool value) => isGuest.value = !value;
}
