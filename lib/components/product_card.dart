import 'package:flutter/material.dart';

import '../helper/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.45, // Adjust the width according to screen width
      height: 281,
      decoration: BoxDecoration(
        color: kSuperLightGreyColor,
        border: Border.all(color: kLightGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Image.asset(
                    'assets/images/product_demo.png',
                    // Replace with your image asset
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 115,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Custom Baju Hitam Polos',
                        style: TextStyle(
                          color: kBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        'Rp. 99.000',
                        style: TextStyle(
                          color: kBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: kPrimaryColor,
                            size: 10,
                          ),
                          const Text(
                            '4.5 | 10 Stok | 5 Terjual',
                            style: TextStyle(
                              color: kDarkGreyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 91,
              height: 21,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Lengan Panjang',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
