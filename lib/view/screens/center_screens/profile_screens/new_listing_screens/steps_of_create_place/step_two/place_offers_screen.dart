import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_tow/place_offers_contoller.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class PlaceOffersScreen extends StatelessWidget {
  const PlaceOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GetBuilder<PlaceOffersController>(
          init: PlaceOffersController(),
          builder: (ctr) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const HeadlinePageTitle(
                      title: 'Tell guests what you place has to offer',
                      subTitle:
                          'You can add more amenities after you publish your listing.'),
                  GridView.builder(
                      itemCount: ctr.typesOfPlaces.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              ctr.choosePLase(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black87,
                                      width: ctr.itemSelectCount.contains(
                                              ctr.typesOfPlaces[index][0])
                                          ? 2
                                          : 0.6,
                                    )),
                                height: 30,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        ctr.typesOfPlaces[index][1],
                                        size: 30,
                                      ),
                                      Text(
                                        ctr.typesOfPlaces[index][0],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )),
                          )),
                ],
              ),
            );
          }),
    );
  }
}
