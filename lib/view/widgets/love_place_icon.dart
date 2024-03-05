import 'package:flutter/material.dart';

Widget lovePalceIcon({required VoidCallback onPressed, bool isLike = false}) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: !isLike ? Colors.black87.withOpacity(0.5) : Colors.red,
          size: 32,
        ),
      ),
      IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 32,
        ),
      ),
    ],
  );
}
