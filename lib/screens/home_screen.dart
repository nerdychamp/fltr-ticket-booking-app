import 'package:book_tickets/screens/hotel_card.dart';
import 'package:book_tickets/screens/ticket_view.dart';
import 'package:book_tickets/utils/app_icons.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          /* 
            Heading and search bar
           */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                /*
                  heading
                 */
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: Styles.headlineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          'Book Ticket',
                          style: Styles.headlineStyle1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage("assets/images/img_1.png"),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Gap(25),
                /*
                  search bar
                 */
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        AppIcons.searchRegular,
                        color: const Color(0xFFbFC205),
                      ),
                      const Gap(4),
                      Text(
                        'Search',
                        style: Styles.headlineStyle4,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(40),
          /* 
            ticket view
           */
          Column(
            children: [
              /*
                upcoming tickets
               */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Flights',
                      style: Styles.headlineStyle2,
                    ),
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
              ),
              const Gap(15),
              /* 
                tickets
               */
              SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ticketList
                      .map((ticket) => TicketView(ticket: ticket))
                      .toList(),
                ),
              )
            ],
          ),
          const Gap(15),
          /* 
            hotels list
           */
          Column(
            children: [
              /* 
                title 
               */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hotels',
                      style: Styles.headlineStyle2,
                    ),
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
              ),
              const Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: hotelList
                      .map((hotel) => HotelCard(hotel: hotel))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
