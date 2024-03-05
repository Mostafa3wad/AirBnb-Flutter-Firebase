import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_three/discount_controller.dart';
import 'package:project_one/view/widgets/discount_card.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetX<DiscountController>(
          init: DiscountController(),
          builder: (ctr) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: HeadlinePageTitle(
                      title: 'Just one last step!\nAdd Discounts',
                      subTitle:
                          'Help your place stand out to get booked first reviews.'),
                ),
                const SizedBox(height: 40),
                DiscountCard(
                  title: 'New listing promotion',
                  subTitle: 'Offer 20% off your first 3 bookings',
                  discount: 20,
                  value: ctr.isPrimary.value,
                  onChanged: ctr.primarycheskBox,
                ),
                DiscountCard(
                  title: 'Weekly discount',
                  subTitle: 'for stays of 7 nights or more',
                  value: ctr.isWeekly.value,
                  controller: ctr.weeklyController.value,
                  onChanged: ctr.weeklycheskBox,
                ),
                DiscountCard(
                  title: 'Monthly discount',
                  subTitle: 'for stays of 28 nights or more',
                  value: ctr.isMonthly.value,
                  controller: ctr.monthlyController.value,
                  onChanged: ctr.monthlycheskBox,
                ),
              ],
            );
          }),
    );
  }
}
