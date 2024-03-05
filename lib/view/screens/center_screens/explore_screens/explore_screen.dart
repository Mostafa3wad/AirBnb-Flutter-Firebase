import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/home/center_home_controller.dart';
import 'package:project_one/controller/home/explore_controller.dart';
import 'package:project_one/models/place_model.dart';
import 'package:project_one/view/widgets/item_card.dart';
import 'package:project_one/view/widgets/love_place_icon.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference places =
        FirebaseFirestore.instance.collection('places');
    return GetBuilder<CenterHomeController>(
        init: CenterHomeController(),
        builder: (ctr) {
          return StreamBuilder<QuerySnapshot>(
            stream: places
                .where('place_type',
                    isEqualTo: ctr.placesTypes[ctr.selectedTapViewIndex]
                        ['type'])
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  PlaceModel placeModel = PlaceModel.fromJson(
                      document.data()! as Map<String, dynamic>);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        ItemCard(placeModel: placeModel),
                        // Love Icon
                        Positioned(
                            top: 16,
                            right: 16,
                            child: GetBuilder<ExploreController>(
                                init: ExploreController(),
                                builder: (controller) {
                                  if (controller.userModel == null) {
                                    return lovePalceIcon(onPressed: () {});
                                  }
                                  return lovePalceIcon(
                                      onPressed: () {
                                        controller.addFavioretPlace(
                                            placeModel.id,
                                            controller.userModel!.wishlist!
                                                .contains(placeModel.id));
                                      },
                                      isLike: controller.userModel!.wishlist!
                                          .contains(placeModel.id));
                                }))
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          );
        });
  }
}
