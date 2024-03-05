import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_one/controller/new_place/step_one/choose_location_controller.dart';
import 'package:project_one/view/widgets/addres_bottom_sheet.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: GetBuilder<ChooseLocationController>(
          init: ChooseLocationController(),
          builder: (ctr) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Text(
                    'Where\'s your place located?\nPlease put a pin',
                    style: textTheme.headlineLarge!.copyWith(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your address is only shared with guests after they\'ve made a reservation',
                      style: textTheme.labelMedium!
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: Get.height * 0.5,
                  child: GoogleMap(
                    onTap: ctr.addLoctaion,
                    markers: ctr.marker.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: ctr.kGooglePlex.value,
                    onMapCreated: (GoogleMapController controller) {
                      ctr.googleMapcontroller = controller;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                if (ctr.fullStreet.isNotEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          ctr.fullStreet,
                        ),
                      ),
                      MaterialButton(
                        height: 30,
                        color: Colors.white.withOpacity(0.85),
                        shape: const CircleBorder(),
                        onPressed: () =>
                            Get.bottomSheet(const AddressBottomShert()),
                        child: const Icon(
                          Icons.edit_location_alt_outlined,
                          color: Colors.black87,
                          size: 25,
                        ),
                      )
                    ],
                  )
              ],
            );
          }),
    );
  }
}
