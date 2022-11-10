import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

class DashedLine extends StatelessWidget {
  final bool isColored;

  const DashedLine({
    super.key,
    required this.isColored,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int dash = (constraints.constrainWidth() / 15).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            dash,
            (index) => SizedBox(
              width: AppLayout.getWidth(5),
              height: AppLayout.getHeight(1),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isColored ? Colors.white : Colors.grey.shade400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
