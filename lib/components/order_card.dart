import 'package:flutter/material.dart';

import '../helper/constants.dart'; // Ensure you have the necessary constants defined

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9, // Adjust the width according to screen width
      height: 178,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: Image.asset(
                'assets/images/product_demo.png', // Replace with your image asset
                height: height / 7,
                width: width / 4.5,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cutom Baju Hitam Polos',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: kBlackColor
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Order ID: #123456',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: kDarkGreyColor,
                      ),
                    ),
                    const Text(
                      'Buyer: John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: kDarkGreyColor,
                      ),
                    ),
                    const Text(
                      'Pcs: 2',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: kDarkGreyColor,
                      ),
                    ),
                    const Text(
                      'Expedition: FedEx',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: kDarkGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
