import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/order_card.dart';
import 'package:klambi_admin/screens/orders/components/order_list.dart';
import 'package:klambi_admin/screens/orders/orders_controller.dart';

import '../../helper/constants.dart';
import 'components/header.dart';

class OrdersScreenView extends GetView<OrdersController> {
  const OrdersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            const Header(),
            SizedBox(height: 50),
            OrderList(),
          ],
        ),
      ),
    );
  }
}
