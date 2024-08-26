import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package for formatting
import 'package:klambi_admin/components/custom_button.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/orders/detail_orders/components/design.dart';
import 'package:klambi_admin/screens/orders/detail_orders/components/receipt.dart';
import 'package:klambi_admin/screens/orders/detail_orders/detail_orders_controller.dart';

import '../../../models/order_response_model.dart';
import 'components/status_dropdown.dart';

class DetailOrdersScreenView extends GetView<DetailOrdersController> {
  const DetailOrdersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Datum orderDetails = Get.arguments as Datum; // Retrieve the passed order object

    controller.fetchOrderData(orderDetails.order.id);

    // Create a NumberFormat object for Indonesian Rupiah
    final NumberFormat currencyFormat =
    NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);

    // Format the order date to show only the date without the time
    final String formattedDate = DateFormat('dd MMM yyyy')
        .format(orderDetails.order.orderTime.toLocal());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kWhiteColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 2);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Detail Pesanan",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '1. Struk Pemesanan:',
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Receipt(
                  orderDetails: orderDetails,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    '2. Pesanan:',
                    style: TextStyle(
                        color: kBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Design(orderDetails: orderDetails),
                SizedBox(height: 10),
                StatusDropdown(
                  statusOptions: controller.statusOptions,
                  orderId: orderDetails.order.id, // Use the correct order ID
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
