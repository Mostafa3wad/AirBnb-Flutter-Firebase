import 'package:geocoding/geocoding.dart';
import 'package:project_one/util/printer.dart';

class AddressRepositories {
  static Future<String> getAdress(
      {required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address = '${place.name}, ${place.locality}, ${place.country}';
        Printer.print('Address: $address');
        return address;
      } else {
        Printer.print('No address found for the given coordinates.');
        return '';
      }
    } catch (e) {
      Printer.print('Error retrieving address: $e');
      return '';
    }
  }
}
