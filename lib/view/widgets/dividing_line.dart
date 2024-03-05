import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DividingLine extends StatelessWidget {
  const DividingLine({super.key, this.withOr = false});

  final bool withOr;

  @override
  Widget build(BuildContext context) {
    return withOr
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.grey,
                width: Get.width * 0.42,
                height: 1,
              ),
              const Text(' or '),
              Container(
                color: Colors.grey,
                width: Get.width * 0.42,
                height: 1,
              )
            ],
          )
        : Container(
            color: Colors.grey,
            width: Get.width,
            height: 0.5,
          );
  }
}
