import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    this.height,
    this.text,
    this.icon,
    this.color = Colors.black,
    this.widget,
  }) : assert(widget == null || text == null);
  final VoidCallback onPressed;
  final Widget? widget;
  final String? text;
  final IconData? icon;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.black, width: 0.8)),
        height: height != null
            ? height
            : widget == null
                ? 50
                : 55,
        width: Get.width * 0.95,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      color: color,
                    ),
                    Text(
                      text!,
                      style: textTheme.displayLarge,
                    ),
                    const SizedBox(width: 20)
                  ],
                )
              : widget!,
        ),
      ),
    );
  }
}
