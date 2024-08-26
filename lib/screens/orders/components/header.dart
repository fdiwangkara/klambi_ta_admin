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
                      style: TextStyle(
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
                tabs: controller.statusList
                    .map((status) => Tab(text: status))
                    .toList(),
                onTap: (index) {
                  controller.onStatusSelected(controller.statusList[index]);
                },
              ),
            ),
          ],
        ),
      )
          : SizedBox.shrink(),
    );
  }
}
