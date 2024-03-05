import 'package:flutter/material.dart';

Widget iconCircleButton(
        {required VoidCallback onPressed, required IconData icon}) =>
    Positioned(
        top: -5,
        right: -24,
        child: MaterialButton(
          height: 25,
          color: Colors.white.withOpacity(0.85),
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            icon,
            color: Colors.black87,
            size: 20,
          ),
        ));
