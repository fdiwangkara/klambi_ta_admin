import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/orders/orders_controller.dart';

class OrdersScreenView extends GetView<OrdersController> {
  const OrdersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(

    );
  }
}
