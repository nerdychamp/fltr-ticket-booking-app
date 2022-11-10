import 'package:flutter/material.dart';

class ThickRing extends StatelessWidget {
  final bool isColored;

  const ThickRing({
    super.key,
    required this.isColored,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            width: 2.5,
            color: isColored ? Colors.white : const Color(0xff8accf7)),
      ),
    );
  }
}
