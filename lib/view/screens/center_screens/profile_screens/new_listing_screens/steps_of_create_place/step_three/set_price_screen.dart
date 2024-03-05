import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/step_three/set_price_controller.dart';
import 'package:project_one/view/widgets/headline_page.dart';

class SetPriceScreen extends StatelessWidget {
  const SetPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<SetPriceController>(
          init: SetPriceController(),
          builder: (ctr) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: HeadlinePageTitle(
                      title: 'Now, set your price',
                      subTitle: 'you can change it anytime.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ctr.priceController.text.length * 40,
                      child: TextField(
                        maxLength: 5,
                        maxLines: 1,
                        minLines: 1,
                        onChanged: ctr.onChanged,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: ctr.priceController,
                        style: textTheme.headlineLarge!.copyWith(
                            fontSize: 40, fontWeight: FontWeight.w900),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$',
                                  style: textTheme.headlineLarge!.copyWith(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900),
                                ),
                                const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            const SizedBox(height: 26)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox()
              ],
            );
          }),
    );
  }
}
