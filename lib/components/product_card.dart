import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/constants.dart';
import '../../models/product_response_model.dart';
import 'package:intl/intl.dart';  // Import for number formatting

class ProductCard extends StatelessWidget {
  final Datum product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final double width = MediaQuery.of(context).size.width;

    // Function to format the price with dot separator
    String formatPrice(int price) {
      final formatter = NumberFormat('#,##0', 'en_US');
      return formatter.format(price);
    }

    return GestureDetector(
      onTap: () {
        Get.offNamed('/editProduct', arguments: product);
      },
      child: Container(
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
                    child: Image.network(
                      product.imageUrl,
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
                        Text(
                          product.title.length > 35 ? '${product.title.substring(0, 35)}...' : product.title,
                          style: const TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Rp. ${formatPrice(product.price)}',
                          style: const TextStyle(
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
                            Text(
                              '${product.rate} | 15 Stok | 10 Terjual',
                              style: const TextStyle(
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
                width: 110,
                height: 25,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    product.category.toString().split('.').last,
                    style: const TextStyle(
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
      ),
    );
  }
}
