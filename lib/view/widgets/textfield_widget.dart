import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.name,
      this.helperText,
      this.hintText,
      this.isEnabled = true});

  final TextInputType? textInputType;
  final String? helperText, hintText;
  final TextEditingController controller;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return TextField(
      style: !isEnabled ? textTheme.labelSmall : textTheme.displaySmall,
      controller: controller,
      enabled: isEnabled,
      obscureText: hintText == 'password',
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.8)),
        suffixIcon: IconButton(
            icon: const Icon(Icons.clear, size: 18),
            onPressed: () => controller.clear()),
        border: const OutlineInputBorder(),
        helperText: helperText,
        helperMaxLines: 2,
        helperStyle: textTheme.labelSmall,
        hintText: hintText,
      ),
    );
  }
}
