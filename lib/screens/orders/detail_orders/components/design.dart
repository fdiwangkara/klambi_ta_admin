import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../helper/constants.dart';
import '../../../../models/order_response_model.dart';

class Design extends StatelessWidget {
  final Datum orderDetails;

  const Design({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width *
        0.9; // Assuming 90% width for responsiveness
    final double containerHeight = MediaQuery.of(context).size.width * 1.2;

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: kLightGreyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: orderDetails.products.map((product) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text above the product image
                  const Text(
                    "Produk Yang Dibeli",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(height: 10), // Space between text and image

                  Row(
                    children: [
                      // Product Image
                      Image.network(
                        product.image,
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.width / 3.5,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      // Product Details
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Title
                          Container(
                            width: 150, // Set the width of the text container
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                              ),
                              maxLines: 3, // Limit the text to 2 lines
                              overflow: TextOverflow
                                  .ellipsis, // Adds "..." if the text exceeds the number of lines
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Product Size
                          Text(
                            'Size: ${product.size}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: kDarkGreyColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Product Quantity
                          Text(
                            'Quantity: ${product.quantity}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: kDarkGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Design Pelanggan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    orderDetails.image!.path,
                    width: MediaQuery.of(context).size.width / 1.25,
                    height: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
