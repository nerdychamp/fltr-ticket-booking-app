import 'package:book_tickets/utils/app_icons.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:book_tickets/widgets/thick_ring.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final TextStyle headline3White =
        Styles.headlineStyle3.copyWith(color: Colors.white);
    final TextStyle headline4White =
        Styles.headlineStyle4.copyWith(color: Colors.white);

    /* 
      ticket or card
     */
    return Container(
      // we can use Container widget as well instead of SizedBox
      margin: const EdgeInsets.only(right: 16),
      width: size.width * 0.82,
      height: 200,
      child: Column(
        children: [
          /* 
            blue container
           */
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Styles.blueColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
              ),
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NYC",
                      style: headline3White,
                    ),
                    const Spacer(),
                    const ThickRing(),
                    Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: LayoutBuilder(
                              builder: (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
                                final int dots =
                                    (constraints.constrainWidth() / 6).floor();
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      dots,
                                      (index) => const SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                AppIcons.airport,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThickRing(),
                    const Spacer(),
                    Text(
                      "LDN",
                      style: headline3White,
                    ),
                  ],
                ),
                const Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'New-York',
                        style: headline4White,
                      ),
                    ),
                    Text(
                      '8H 30M',
                      style: headline4White,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'London',
                        textAlign: TextAlign.end,
                        style: headline4White,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* 
            middle section
           */
          Container(
            color: Styles.orangeColor,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final int dash =
                            (constraints.constrainWidth() / 15).floor();
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                            dash,
                            (index) => const SizedBox(
                              width: 5,
                              height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /* 
            orange container
           */
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
            decoration: BoxDecoration(
              color: Styles.orangeColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1 May", style: headline3White),
                    const Gap(5),
                    Text('Date', style: headline4White),
                  ],
                ),
                Column(
                  children: [
                    Text('08:00 AM', style: headline3White),
                    const Gap(5),
                    Text('Departure Time', style: headline4White),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('23', style: headline3White),
                    const Gap(5),
                    Text('Number', style: headline4White),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
