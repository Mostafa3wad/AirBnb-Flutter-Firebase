import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/home/explore_controller.dart';
import 'package:project_one/shared/config/color.dart';
import 'package:project_one/models/place_model.dart';
import 'package:project_one/services/printer.dart';
import 'package:project_one/view/widgets/item_card.dart';
import 'package:project_one/view/widgets/love_place_icon.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        color: AppColor.backgroundColor,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Wishlist',
                  style: textTheme.headlineLarge,
                ),
              ),
            ),
            GetBuilder<ExploreController>(
                init: ExploreController(),
                builder: (ctr) {
                  if (ctr.userModel == null) {
                    return nothingData(context);
                  } else if (ctr.userModel!.wishlist!.isNotEmpty) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('places')
                          .where('id', whereIn: ctr.userModel!.wishlist)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        Printer.print(snapshot.data!.docs);

                        return Column(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            PlaceModel placeModel = PlaceModel.fromJson(
                                document.data()! as Map<String, dynamic>);
                            return Stack(
                              children: [
                                ItemCard(placeModel: placeModel),
                                // Love Icon
                                Positioned(
                                    top: 16,
                                    right: 16,
                                    child: (ctr.userModel == null)
                                        ? lovePalceIcon(onPressed: () {})
                                        : lovePalceIcon(
                                            onPressed: () {
                                              ctr.addFavioretPlace(
                                                  placeModel.id,
                                                  ctr.userModel!.wishlist!
                                                      .contains(placeModel.id));
                                            },
                                            isLike: ctr.userModel!.wishlist!
                                                .contains(placeModel.id)))
                              ],
                            );
                          }).toList(),
                        );
                      },
                    );
                  } else {
                    return nothingData(context);
                  }
                })
          ]),
        ));
  }

  Widget nothingData(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Create youe wishlist',
              style: textTheme.displayLarge,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "As you search, tap the heart icon to save your favorite places and experience to a wishlist",
              style: textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
