import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_admin/helper/constants.dart';

import '../../../../models/order_response_model.dart';

class Receipt extends StatelessWidget {
  final Datum orderDetails;

  const Receipt({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * 0.9;
    const double containerHeight = 530;

    // Create a NumberFormat object for Indonesian Rupiah
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);

    // Format the order date to show only the date without the time
    final String formattedDate = DateFormat('dd MMM yyyy').format(orderDetails.order.orderTime.toLocal());

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: kLightGreyColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Id: #${orderDetails.order.id}',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: kLightGreyColor),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tanggal:',
                  style: TextStyle(
                    color: kDarkGreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  formattedDate, // Format date
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: kLightGreyColor),
            const SizedBox(height: 10),
            Text(
              '${orderDetails.order.address.namaLengkap}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('assets/icons/address_icon.svg'),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${orderDetails.order.address.keterangan}, ${orderDetails.order.address.provinsi}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kDarkGreyColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('assets/icons/phone_icon.svg'),
                const SizedBox(width: 10),
                Text(
                  '${orderDetails.order.address.nomorTelepon}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kDarkGreyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: kLightGreyColor),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pembayaran:',
                  style: TextStyle(
                    color: kDarkGreyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${orderDetails.order.paymentMethod}',
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: kLightGreyColor),
            const SizedBox(height: 10),
            const Text(
              'Rincian',
              style: TextStyle(
                color: kDarkGreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pcs:',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${orderDetails.products.fold<int>(0, (sum, item) => sum + item.quantity)}',
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal:',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  currencyFormat.format(orderDetails.products.fold<int>(0, (sum, item) => sum + item.price)), // Subtotal
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Biaya Pengiriman:',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  currencyFormat.format(orderDetails.order.shippingFee), // Shipping Fee
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Biaya Admin:',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  currencyFormat.format(orderDetails.order.handlingFee), // Handling Fee
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currencyFormat.format(orderDetails.order.totalPrice), // Total Price
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
