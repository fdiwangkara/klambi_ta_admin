import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/constants.dart';
import '../detail_orders_controller.dart';

class StatusDropdown extends StatelessWidget {
  final List<String> statusOptions;
  final int orderId;

  const StatusDropdown({Key? key, required this.statusOptions, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailOrdersController>();
    return Obx(() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kLightGreyColor),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: controller.selectedStatus.value.isNotEmpty ? controller.selectedStatus.value : null,
            icon: const Icon(Icons.arrow_drop_down),
            dropdownColor: kWhiteColor,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              if (newValue != null) {
                controller.selectedStatus.value = newValue;
                controller.updateOrderStatus(orderId);// Update order status immediately
              }
            },
            items: statusOptions.map<DropdownMenuItem<String>>((String value) {
              // Replace underscores with spaces and capitalize the text
              final formattedValue = value.replaceAll('_', ' ').capitalize!;
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  formattedValue,
                  style: const TextStyle(fontSize: 16, color: kBlackColor),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
