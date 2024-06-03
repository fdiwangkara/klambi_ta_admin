import 'package:flutter/material.dart';
import 'package:klambi_admin/components/custom_card.dart';

class InformationScroll extends StatelessWidget {
  const InformationScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Penjualan (Bulan Ini)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                CustomCard(topText: 'Total pesanan', bottomText: '120 Pcs'),
                CustomCard(topText: 'Total terkirim', bottomText: '58 Pcs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
