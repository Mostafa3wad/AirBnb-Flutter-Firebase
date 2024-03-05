import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DiscountCard extends StatelessWidget {
  DiscountCard(
      {super.key,
      this.discount,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.onChanged,
      this.controller})
      : assert(controller == null || discount == null),
        assert(controller != null || discount != null);

  final int? discount;
  final String title;
  final String subTitle;
  final Function(bool?) onChanged;
  final bool value;
  TextEditingController? controller = TextEditingController(text: '10');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          discount != null
              ? Text(
                  '$discount%',
                  style: textTheme.bodyMedium,
                )
              : Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: value ? Colors.white : Colors.grey[200],
                      border: Border.all(
                          color: value ? Colors.black87 : Colors.black26,
                          width: 0.6),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: TextField(
                          enabled: value,
                          controller: controller,
                          maxLength: 2,
                          maxLines: 1,
                          minLines: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: textTheme.bodyMedium,
                          decoration: const InputDecoration(
                              border: InputBorder.none, counterText: ''),
                        ),
                      ),
                      Text(
                        '%',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: textTheme.labelMedium!.copyWith(color: Colors.black),
                softWrap: true,
              ),
              Text(
                subTitle,
                style: textTheme.labelSmall,
              ),
            ],
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
            checkColor: Colors.white,
            activeColor: Colors.black,
          )
        ],
      ),
    );
  }
}
