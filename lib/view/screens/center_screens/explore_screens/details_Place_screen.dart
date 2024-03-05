import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/models/place_model.dart';

class DetailsPlaceScreen extends StatelessWidget {
  const DetailsPlaceScreen({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: Get.width,
          height: Get.width - 40,
          child: PageView(
            children: placeModel.images
                .map((e) => Hero(
                      tag: placeModel.id,
                      child: Image.network(
                        e,
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: 400,
                      ),
                    ))
                .toList(),
          )),
    );
  }
}
