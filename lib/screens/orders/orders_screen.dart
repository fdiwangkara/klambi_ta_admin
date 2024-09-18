import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/order_list.dart';
import 'orders_controller.dart';
import '../../helper/constants.dart';
import 'components/header.dart';

class OrdersScreenView extends GetView<OrdersController> {
  const OrdersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersController controller = Get.put(OrdersController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                backgroundColor: kSecondaryColor,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: 25),
                  const OrderList(),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
