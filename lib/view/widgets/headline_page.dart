import 'package:flutter/material.dart';

class HeadlinePageTitle extends StatelessWidget {
  const HeadlinePageTitle(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: textTheme.headlineLarge,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              subTitle,
              style:
                  textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }
}
