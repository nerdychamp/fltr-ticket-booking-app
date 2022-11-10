import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.hotel});

  final Map<String, dynamic> hotel;

  @override
  Widget build(BuildContext context) {
    final TextStyle headline1Kaki =
        Styles.headlineStyle1.copyWith(color: Styles.kaiColor);
    final TextStyle headline2Kaki =
        Styles.headlineStyle2.copyWith(color: Styles.kaiColor);
    final TextStyle headline3White =
        Styles.headlineStyle2.copyWith(color: Colors.white);
    final Size size = AppLayout.getSize(context);

    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5, bottom: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
              image: DecorationImage(
                image: AssetImage("assets/images/${hotel['image']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(10),
          Text(hotel["place"], style: headline2Kaki),
          const Gap(5),
          Text(hotel["destination"], style: headline3White),
          const Gap(8),
          Text("\$${hotel['price']}/night", style: headline1Kaki),
        ],
      ),
    );
  }
}
