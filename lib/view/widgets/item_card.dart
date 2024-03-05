import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/models/place_model.dart';
import 'package:project_one/view/screens/center_screens/explore_screens/details_Place_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () => Get.to(() => DetailsPlaceScreen(
                placeModel: placeModel,
              )),
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: Get.width,
            height: Get.width - 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: PageView(
              children: placeModel.images
                  .map((e) => Stack(
                        children: [
                          // Palces Iamges
                          Hero(
                            tag: placeModel.id,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/img/loading.gif',
                              image: e,
                              fit: BoxFit.cover,
                              width: Get.width,
                              height: 400,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        // Places Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              placeModel.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              placeModel.city,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              'night ${placeModel.price} EGP',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ],
    );
  }
}
