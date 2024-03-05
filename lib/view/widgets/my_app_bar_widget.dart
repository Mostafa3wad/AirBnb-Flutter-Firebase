import 'package:flutter/material.dart';
import 'package:project_one/shared/config/color.dart';
import 'package:get/get.dart';
import 'package:project_one/view/screens/booking_details_screen.dart';
import 'package:project_one/view/widgets/property_type_list.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return AppBar(
    toolbarHeight: 150,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.appBlack.withOpacity(0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 1.0),
          )
        ],
      ),
      child: Stack(
        children: [
          // Search Bar
          Positioned(
            left: 16.0,
            right: 72.0,
            top: 45.0,
            child: GestureDetector(
              onTap: () => Get.to(() => const BookingDetailsScreen()),
              child: Hero(
                tag: 'planning',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.appWhite,
                    border: Border.all(color: AppColor.appGrey, width: 1.0),
                    borderRadius: BorderRadius.circular(32.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.appGrey.withOpacity(0.5),
                        blurRadius: 8.0,
                        spreadRadius: 8.0,
                        offset: const Offset(0, 4.0),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where to?',
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Anywhere • Any week • Add guest',
                            style: textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ____Tap View____
          const Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: PropertyTypeList(),
          ),
          //___Filter Icon____
          Positioned(
            right: 16.0,
            top: 50.0,
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(color: AppColor.appGrey, width: 1.0),
                ),
              ),
              icon: const Icon(Icons.tune),
            ),
          ),
        ],
      ),
    ),
  );
}
