import 'package:book_tickets/utils/app_icons.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:book_tickets/widgets/dashed_line.dart';
import 'package:book_tickets/widgets/thick_ring.dart';
import 'package:book_tickets/widgets/ticket_column_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    super.key,
    required this.ticket,
    this.isColored = true,
  });

  final Map<String, dynamic> ticket;
  final bool isColored;

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final TextStyle headline3White = isColored
        ? Styles.headlineStyle3.copyWith(color: Colors.white)
        : Styles.headlineStyle3;
    final TextStyle headline4White = isColored
        ? Styles.headlineStyle4.copyWith(color: Colors.white)
        : Styles.headlineStyle4;

    /* 
      ticket or card
     */
    return Container(
      // we can use Container widget as well instead of SizedBox
      margin: EdgeInsets.only(right: AppLayout.getWidth(16)),
      width: size.width * 0.82,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 163 : 165),
      child: Column(
        children: [
          /* 
            blue container
           */
          Container(
            padding: EdgeInsets.all(AppLayout.getHeight(16)),
            decoration: BoxDecoration(
              color: isColored ? Styles.blueColor : Colors.white,
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
                    ThickRing(
                      isColored: isColored,
                    ),
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
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: isColored
                                                ? Colors.white
                                                : Colors.grey.shade400,
                                          ),
                                        ),
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
                                color: isColored
                                    ? Colors.white
                                    : const Color(0xff8accf7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ThickRing(
                      isColored: isColored,
                    ),
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
            color: isColored ? Styles.orangeColor : Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: AppLayout.getWidth(10),
                  height: AppLayout.getHeight(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isColored ? Styles.bgColor : Colors.white,
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
                      child: DashedLine(isColored: isColored)),
                ),
                SizedBox(
                  width: AppLayout.getWidth(10),
                  height: AppLayout.getHeight(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isColored ? Styles.bgColor : Colors.white,
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
              color: isColored ? Styles.orangeColor : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: isColored
                    ? Radius.circular(AppLayout.getHeight(21))
                    : Radius.zero,
                bottomRight: isColored
                    ? Radius.circular(AppLayout.getHeight(21))
                    : Radius.zero,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketColumnLayout(
                  alignment: CrossAxisAlignment.start,
                  firstText: ticket["date"],
                  secondText: "Date",
                  isColored: isColored,
                ),
                TicketColumnLayout(
                  alignment: CrossAxisAlignment.center,
                  firstText: ticket["departure_time"],
                  secondText: "Departure Time",
                  isColored: isColored,
                ),
                TicketColumnLayout(
                  alignment: CrossAxisAlignment.center,
                  firstText: ticket["number"].toString(),
                  secondText: "Number",
                  isColored: isColored,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
