import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheskBoxWidget extends StatelessWidget {
  const CheskBoxWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.onChanged});

  final String title;
  final String subTitle;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        onChanged;
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black87,
                width: 0.6,
              )),
          width: Get.width,
          height: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Switch(
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.white,
                        activeColor: Colors.black,
                        value: value,
                        onChanged: onChanged)
                  ],
                ),
                Text(
                  subTitle,
                  style: textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                )
              ],
            ),
          )),
    );
  }
}
