import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_style.dart';

class TicketColumnLayout extends StatelessWidget {
  final String firstText;
  final String secondText;
  final CrossAxisAlignment alignment;
  final bool isColored;

  const TicketColumnLayout({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.alignment,
    required this.isColored,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle headline3White = isColored
        ? Styles.headlineStyle3.copyWith(color: Colors.white)
        : Styles.headlineStyle3;
    final TextStyle headline4White = isColored
        ? Styles.headlineStyle4.copyWith(color: Colors.white)
        : Styles.headlineStyle4;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: headline3White),
        const Gap(5),
        Text(secondText, style: headline4White),
      ],
    );
  }
}
