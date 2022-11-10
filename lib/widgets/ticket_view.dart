import 'package:book_tickets/utils/app_icons.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:book_tickets/widgets/thick_ring.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.ticket});

  final Map<String, dynamic> ticket;

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
      margin: EdgeInsets.only(right: AppLayout.getWidth(16)),
      width: size.width * 0.82,
      height: AppLayout.getHeight(180),
      child: Column(
        children: [
          /* 
            blue container
           */
          Container(
            padding: EdgeInsets.all(AppLayout.getHeight(16)),
            decoration: BoxDecoration(
              color: Styles.blueColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.getWidth(21)),
                topRight: Radius.circular(AppLayout.getWidth(21)),
              ),
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticket["from"]['code'],
                      style: headline3White,
                    ),
                    const Spacer(),
                    const ThickRing(),
                    Expanded(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
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
                                      (index) => SizedBox(
                                        width: AppLayout.getWidth(3),
                                        height: AppLayout.getHeight(1),
                                        child: const DecoratedBox(
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
                      ticket['to']['code'],
                      style: headline3White,
                    ),
                  ],
                ),
                const Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        ticket['from']['name'],
                        style: headline4White,
                      ),
                    ),
                    Text(
                      ticket['flying_time'],
                      style: headline4White,
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        ticket['to']['name'],
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
                  width: AppLayout.getWidth(10),
                  height: AppLayout.getHeight(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppLayout.getHeight(10)),
                        bottomRight: Radius.circular(AppLayout.getHeight(10)),
                      ),
                    ),
                  ),
                ),

                /* 
                  Doted lines
                 */
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppLayout.getHeight(10)),
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
                            (index) => SizedBox(
                              width: AppLayout.getWidth(5),
                              height: AppLayout.getHeight(1),
                              child: const DecoratedBox(
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
                  width: AppLayout.getWidth(10),
                  height: AppLayout.getHeight(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppLayout.getHeight(10)),
                        bottomLeft: Radius.circular(AppLayout.getHeight(10)),
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                bottomRight: Radius.circular(AppLayout.getHeight(21)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ticket["date"], style: headline3White),
                    const Gap(5),
                    Text('Date', style: headline4White),
                  ],
                ),
                Column(
                  children: [
                    Text(ticket['departure_time'], style: headline3White),
                    const Gap(5),
                    Text('Departure Time', style: headline4White),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(ticket['number'].toString(), style: headline3White),
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
