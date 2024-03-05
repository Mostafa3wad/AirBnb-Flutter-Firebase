import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/home/center_home_controller.dart';

class PropertyTypeList extends StatelessWidget {
  const PropertyTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 65.0,
      child: GetBuilder<CenterHomeController>(
          init: CenterHomeController(),
          builder: (ctr) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: ctr.placesTypes.length,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width * 0.2,
                  margin: const EdgeInsets.only(
                    right: 4.0,
                    left: 4.0,
                    top: 4.0,
                  ),
                  child: GestureDetector(
                    onTap: () => ctr.navTabBar(index),
                    child: Column(
                      children: [
                        Icon(ctr.placesTypes[index]['icon']),
                        const SizedBox(height: 2.0),
                        Text(
                          ctr.placesTypes[index]['type'],
                          style: textTheme.bodySmall!.copyWith(
                            fontWeight: index == ctr.selectedTapViewIndex
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        index == ctr.selectedTapViewIndex
                            ? Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                height: 2.0,
                                width: 64.0,
                                color: Colors.black,
                              ).animate().fadeIn(
                                duration: const Duration(milliseconds: 300))
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
