import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/product_card.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/product/components/header.dart';
import 'package:klambi_admin/screens/product/components/product_grid.dart';
import 'package:klambi_admin/screens/product/product_controller.dart';

class ProductScreenView extends GetView<ProductController> {
  const ProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Obx(
              () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  backgroundColor: kSecondaryColor,
                ),
              );
            } else if (controller.productList.isEmpty) {
              return const Center(
                child: Text(
                  'No products available',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Header(),
                    const SizedBox(height: 50),
                    const ProductGrid(),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offNamed("/addProduct");
          },
          backgroundColor: kPrimaryColor,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
