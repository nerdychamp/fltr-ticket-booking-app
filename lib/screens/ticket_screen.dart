import 'package:barcode_widget/barcode_widget.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:book_tickets/widgets/dashed_line.dart';
import 'package:book_tickets/widgets/ticket_tab.dart';
import 'package:book_tickets/widgets/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/ticket_column_layout.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    return Scaffold(
      body: Container(
        color: Styles.bgColor,
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(AppLayout.getHeight(20)),
              children: [
                Gap(AppLayout.getHeight(40)),
                Text("Tickets", style: Styles.headlineStyle1),
                Gap(AppLayout.getHeight(20)),
                const AppTicketTab(firstTab: "Upcoming", secondTab: "Previous"),
                Gap(AppLayout.getHeight(20)),
                /* 
                  ticket section white
                 */
                Padding(
                  padding: EdgeInsets.only(left: AppLayout.getWidth(15)),
                  child: TicketView(
                    ticket: ticketList[0],
                    isColored: false,
                  ),
                ),
                const Gap(1),
                /* 
                  ticket info section
                 */
                Container(
                  color: Colors.white,
                  margin:
                      EdgeInsets.only(right: AppLayout.getWidth(16), left: 15),
                  width: size.width * 0.82,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TicketColumnLayout(
                            alignment: CrossAxisAlignment.start,
                            firstText: "Flutter Db",
                            secondText: "Passenger",
                            isColored: false,
                          ),
                          TicketColumnLayout(
                            alignment: CrossAxisAlignment.end,
                            firstText: '5221 364869',
                            secondText: 'Passport',
                            isColored: false,
                          ),
                        ],
                      ),
                      const Gap(20),
                      const DashedLine(isColored: false),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TicketColumnLayout(
                            alignment: CrossAxisAlignment.start,
                            firstText: "0055 444 77147",
                            secondText: "Number of E-ticket",
                            isColored: false,
                          ),
                          TicketColumnLayout(
                            alignment: CrossAxisAlignment.end,
                            firstText: "B2SG28",
                            secondText: 'Booking code',
                            isColored: false,
                          ),
                        ],
                      ),
                      const Gap(20),
                      const DashedLine(isColored: false),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/visa.png',
                                    scale: 11,
                                  ),
                                  Text(
                                    " *** 2426",
                                    style: Styles.headlineStyle3,
                                  )
                                ],
                              ),
                              Text(
                                "Payment method",
                                style: Styles.headlineStyle4,
                              )
                            ],
                          ),
                          const TicketColumnLayout(
                            alignment: CrossAxisAlignment.end,
                            firstText: "\$249.99",
                            secondText: 'Price',
                            isColored: false,
                          ),
                        ],
                      ),
                      // const Gap(20),
                    ],
                  ),
                ),
                const Gap(1),
                /* 
                  barcode section
                 */
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: "https://github.com/nerdychamp",
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
                const Gap(20),
                /* 
                  ticket section colored
                 */
                Padding(
                  padding: EdgeInsets.only(left: AppLayout.getWidth(15)),
                  child: TicketView(
                    ticket: ticketList[0],
                  ),
                ),
              ],
            ),
            /* 
              ring and dot
             */
            Positioned(
              left: AppLayout.getHeight(25),
              top: AppLayout.getHeight(245),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor),
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                ),
              ),
            ),
            Positioned(
              right: AppLayout.getHeight(25),
              top: AppLayout.getHeight(245),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor),
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
