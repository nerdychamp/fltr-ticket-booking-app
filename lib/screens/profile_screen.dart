import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:book_tickets/widgets/ticket_column_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_icons.dart';
import '../widgets/dashed_line.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Gap(40),
          /* 
            top section
           */
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* 
                icon section
               */
              Container(
                height: AppLayout.getHeight(86),
                width: AppLayout.getWidth(86),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/img_1.png"),
                  ),
                ),
              ),
              const Gap(10),
              /* 
                middle column
               */
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Book Tickets",
                    style: Styles.headlineStyle1,
                  ),
                  const Gap(2),
                  Text(
                    "New-York",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500),
                  ),
                  const Gap(8),
                  /* 
                    status
                   */
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.blueColor,
                          ),
                          child: Icon(
                            AppIcons.shieldFilled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Premium status",
                          style: Styles.headlineStyle4.copyWith(
                            color: Styles.blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (() {
                      print("You are tapped");
                    }),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Gap(8),
          Divider(color: Colors.grey.shade400),
          const Gap(8),
          /* 
            banner section
           */
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              /* 
                blue ring 
               */
              Positioned(
                top: -30,
                right: -40,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 18,
                      color: const Color(0xff264cd2),
                    ),
                  ),
                ),
              ),
              Container(
                height: AppLayout.getHeight(90),
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 25,
                      child: Icon(AppIcons.lightbulb),
                    ),
                    const Gap(12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You've got a new award",
                          style: Styles.headlineStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "You've 95 flights in a year",
                          style: Styles.textStyle.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(25),
          Text(
            "Accumulated miles",
            style: Styles.headlineStyle2,
          ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              children: [
                /* 
                  miles counter
                 */
                Text(
                  "192802",
                  style: Styles.headlineStyle1.copyWith(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                /* 
                  last mile accrued
                 */
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles Accrued", style: Styles.headlineStyle4),
                    Text("11 November 2022", style: Styles.headlineStyle4),
                  ],
                ),
                Gap(AppLayout.getHeight(4)),
                Divider(color: Colors.grey.shade400),
                Gap(AppLayout.getHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TicketColumnLayout(
                      firstText: "23 042",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start,
                      isColored: false,
                    ),
                    TicketColumnLayout(
                      firstText: "Airline Co",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,
                      isColored: false,
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(12)),
                const DashedLine(isColored: false),
                Gap(AppLayout.getHeight(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TicketColumnLayout(
                      firstText: "24",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start,
                      isColored: false,
                    ),
                    TicketColumnLayout(
                      firstText: "McDonald's",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,
                      isColored: false,
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(12)),
                const DashedLine(isColored: false),
                Gap(AppLayout.getHeight(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TicketColumnLayout(
                      firstText: "52 340",
                      secondText: "Miles",
                      alignment: CrossAxisAlignment.start,
                      isColored: false,
                    ),
                    TicketColumnLayout(
                      firstText: "Exuma",
                      secondText: "Received from",
                      alignment: CrossAxisAlignment.end,
                      isColored: false,
                    ),
                  ],
                ),
                Gap(AppLayout.getHeight(25)),
              ],
            ),
          ),
          InkWell(
            onTap: (() {
              print('yoo are tapped');
            }),
            child: Center(
              child: Text(
                "How to get more miles",
                style: Styles.headlineStyle3.copyWith(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
