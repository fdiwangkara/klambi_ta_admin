import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final IconData icon;
  final String productName;
  final DateTime orderTime;
  final int totalPrice; // Changed to int for easier formatting

  const TransactionCard({
    Key? key,
    required this.icon,
    required this.productName,
    required this.orderTime,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the orderTime to show date and time (hours and minutes)
    final String formattedTime = DateFormat('dd MMM yyyy, HH:mm').format(orderTime);

    // Format the totalPrice to Indonesian Rupiah
    final String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(totalPrice);

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: kLightGreyColor,
            width: 1.0,
          ),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: kSecondaryColor, // Customize the color as needed
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formattedTime, // Use formatted date and time here
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+$formattedPrice', // Use formatted price here
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor, // Customize the color as needed
            ),
          ),
        ],
      ),
    );
  }
}
