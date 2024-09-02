import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/transactions/components/transaction_card.dart';
import 'package:klambi_admin/screens/profile/transactions/transaction_controller.dart';

class TransactionList extends StatelessWidget {
  final TransactionController controller = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    final completedOrders = controller.getCompletedOrders();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: completedOrders.length,
      itemBuilder: (context, index) {
        final order = completedOrders[index];
        return TransactionCard(
          icon: Icons.input,
          productName: order.products.map((product) => product.title).join(", "),
          orderTime: order.order.orderTime,
          totalPrice: order.order.totalPrice,
        );
      },
    );
  }
}
