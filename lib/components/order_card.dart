import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../helper/constants.dart';
import '../models/order_response_model.dart';

class OrderCard extends StatelessWidget {
  final Datum order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final status = order.order.status;
    final formattedText = GetStringUtils(status.replaceAll('_', ' ')).capitalize!;

    // Create a NumberFormat object for Indonesian Rupiah
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);

    // Format the order date to show only the date without the time
    final String formattedDate = DateFormat('dd MMM yyyy').format(order.order.orderTime.toLocal());

    return GestureDetector(
      onTap: () {
        Get.offNamed('/detailOrders', arguments: order);
      },
      child: Container(
        width: width * 0.9,
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Image.network(
                      order.products.isNotEmpty
                          ? order.products[0].image
                          : 'https://via.placeholder.com/150',
                      height: height / 7,
                      width: width / 4.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            order.products.isNotEmpty ? order.products[0].title : 'No Title',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: kBlackColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Order ID: #${order.order.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                          Text(
                            'Pembeli: ${order.order.address.namaLengkap}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                          Text(
                            'Total: ${currencyFormat.format(order.order.totalPrice)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                          Text(
                            'Tanggal: $formattedDate',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                          Text(
                            'Status: ${formattedText}',
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
