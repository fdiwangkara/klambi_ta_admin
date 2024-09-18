import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/constants.dart';
import '../orders_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersController controller = Get.find();

    return Obx(
          () => controller.statusList.isNotEmpty
          ? DefaultTabController(
        length: controller.statusList.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Pesanan Baju',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TabBar(
                isScrollable: true,
                indicatorColor: kSecondaryColor,
                labelColor: kSecondaryColor,
                unselectedLabelColor: kDarkGreyColor,
                tabs: controller.statusList.map((status) {
                  // Replace underscores with spaces and capitalize the text
                  final formattedText = GetStringUtils(status.replaceAll('_', ' ')).capitalize!;
                  return Tab(text: formattedText);
                }).toList(),
                onTap: (index) {
                  controller.onStatusSelected(controller.statusList[index]);
                },
              ),
            ),
          ],
        ),
      )
          : const SizedBox.shrink(),
    );
  }
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
