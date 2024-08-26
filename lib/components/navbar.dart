import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/home/home_screen.dart';
import 'package:klambi_admin/screens/orders/orders_screen.dart';
import 'package:klambi_admin/screens/product/product_screen.dart';

import '../screens/orders/orders_controller.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    print("Changing Tab Index to: $index");
    tabIndex.value = index;
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
    Get.put(LandingPageController(), permanent: false);
    Get.put(OrdersController());
    final args = Get.arguments;
    if (args != null && args is int) {
      print("Received argument: $args");
      landingPageController.changeTabIndex(args);

      // Clear arguments after using them
      Future.delayed(Duration.zero, () {
        Get.offNamed("/navbar");
      });
    }

    return Scaffold(
      bottomNavigationBar:
      buildBottomNavigationMenu(landingPageController),
      body: Obx(() {
        print("Current Tab Index: ${landingPageController.tabIndex.value}");
        return IndexedStack(
          index: landingPageController.tabIndex.value,
          children: [
            HomeScreenView(),
            ProductScreenView(),
            OrdersScreenView(),
          ],
        );
      }),
    );
  }

  Widget buildBottomNavigationMenu(LandingPageController landingPageController) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, -2), // Shadow position (top shadow)
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: landingPageController.tabIndex.value,
        onTap: (index) {
          print("Bottom Navigation Item Clicked: $index");
          landingPageController.changeTabIndex(index);
        },
        backgroundColor: kWhiteColor, // Set the background color here
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: landingPageController.tabIndex.value == 0
                  ? kPrimaryColor
                  : kLightGreyColor,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory_2,
              color: landingPageController.tabIndex.value == 1
                  ? kPrimaryColor
                  : kLightGreyColor,
            ),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 32,
              color: landingPageController.tabIndex.value == 2
                  ? kPrimaryColor
                  : kLightGreyColor,
            ),
            label: 'Orders',
          ),
        ],
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kLightGreyColor,
      ),
    ));
  }
}
