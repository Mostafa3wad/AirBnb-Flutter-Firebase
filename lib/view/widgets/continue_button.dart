import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton(
      {super.key, required this.onPressed, required this.text, this.color});

  final VoidCallback onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      height: 50,
      color: color ?? Colors.redAccent,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Text(
        text,
        style: textTheme.displayMedium,
      ),
    );
  }
}
