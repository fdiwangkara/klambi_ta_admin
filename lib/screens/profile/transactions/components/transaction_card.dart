import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';

class TransactionCard extends StatelessWidget {
  final IconData icon;
  final String description;
  final String dateTime;
  final String amount;
  final Color kBackgroundColor = Colors.white; // Replace with your actual color
  final Color kLightGreyColor = Colors.grey; // Replace with your actual color

  const TransactionCard({
    Key? key,
    required this.icon,
    required this.description,
    required this.dateTime,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: kSuperLightGreyColor,
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
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateTime,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+ Rp $amount',
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
