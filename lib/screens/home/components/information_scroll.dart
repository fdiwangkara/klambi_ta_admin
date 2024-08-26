import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/custom_card.dart';

import '../../orders/orders_controller.dart';

class InformationScroll extends StatelessWidget {
  InformationScroll({super.key});

  final OrdersController ordersController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Penjualan (Saat Ini)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              int totalPesanan = ordersController.orders.length;
              int totalTerkirim = ordersController.orders.where((order) => order.order.status == "pesanan_selesai").length;

              return Row(
                children: [
                  CustomCard(topText: 'Total pesanan', bottomText: '$totalPesanan Pcs'),
                  CustomCard(topText: 'Total terkirim', bottomText: '$totalTerkirim Pcs'),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
