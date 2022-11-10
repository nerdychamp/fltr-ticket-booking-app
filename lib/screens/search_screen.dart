import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/widgets/icon_textbox.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_icons.dart';
import '../utils/app_style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headline1Xl =
        Styles.headlineStyle1.copyWith(fontSize: AppLayout.getWidth(35));
    final size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.all(AppLayout.getHeight(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text(
            "What are\nyou looking for?",
            style: headline1Xl,
          ),
          Gap(AppLayout.getHeight(20)),
          /* 
            toggle tab bar
           */
          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
                color: const Color(0xFFF4F6FD),
              ),
              child: Row(
                children: [
                  /* 
                    airline tickets
                   */
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    width: AppLayout.getWidth(size.width) * 0.44,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: const Center(child: Text("Airline tickets")),
                  ),
                  /* 
                    hotels
                   */
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    width: AppLayout.getWidth(size.width) * 0.44,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(50)),
                      // color: Colors.white,
                    ),
                    child: const Center(child: Text("Hotels")),
                  ),
                ],
              ),
            ),
          ),
          Gap(AppLayout.getHeight(25)),
          /* 
            icon text-box section
           */
          AppIconText(icon: AppIcons.flightTakeOffRounded, text: "Departure"),
          Gap(AppLayout.getHeight(15)),
          AppIconText(icon: AppIcons.flightLandRounded, text: "Arrival"),
          Gap(AppLayout.getHeight(18)),
          /* 
            button
           */
          TextButton(
            style: TextButton.styleFrom(
              elevation: null,
              padding: const EdgeInsets.all(18),
              backgroundColor: const Color(0xD91130CE),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // <-- Radius
              ),
            ),
            onPressed: () {},
            child: Center(
              child: Text("Find Ticket",
                  style: Styles.headlineStyle3.copyWith(color: Colors.white)),
            ),
          ),

          /* 
            discount cards
           */
          Gap(AppLayout.getHeight(40)),
          /* 
            heading
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discounts", style: Styles.headlineStyle2),
              InkWell(
                onTap: () {
                  print("You are tapped");
                },
                child: Text(
                  "View all",
                  style: Styles.textStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Gap(AppLayout.getHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* 
                left column
               */
              Container(
                height: AppLayout.getHeight(400),
                width: size.width * 0.42,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/sit.jpg'),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(12)),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss out of this chance.",
                      style: Styles.headlineStyle2,
                    ),
                  ],
                ),
              ),
              /* 
                right column
               */
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      /* 
                        first card
                       */
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: size.width * .44,
                        height: AppLayout.getHeight(180),
                        decoration: BoxDecoration(
                          color: const Color(0xff3ab8b8),
                          borderRadius: BorderRadius.circular(
                            AppLayout.getHeight(18),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount\nfor survey",
                              style: Styles.headlineStyle2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(10),
                            const Text(
                              "Take the survey about our service and get discount",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 18,
                              color: const Color(0xff189999),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  /* 
                    second card
                   */
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(210),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xffec6545),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Take love",
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(15),
                        /* 
                          emoji section
                         */
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '😍',
                                style: TextStyle(fontSize: 36),
                              ),
                              TextSpan(
                                text: '🥰',
                                style: TextStyle(fontSize: 42),
                              ),
                              TextSpan(
                                text: '😘',
                                style: TextStyle(fontSize: 36),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
