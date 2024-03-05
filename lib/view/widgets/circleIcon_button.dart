import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final double opacity;
  final VoidCallback onPressed;
  final IconData iconData;

  const CircleIconButton(
      {super.key,
      required this.opacity,
      required this.onPressed,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: IconButton(
          onPressed: onPressed,
          icon: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Icon(
                iconData,
                size: 30,
                opticalSize: 0.1,
                fill: 0,
              ),
            ),
          )),
    );
  }
}
