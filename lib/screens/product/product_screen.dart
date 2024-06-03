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
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 50),
            const ProductGrid(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action for the button here
        },
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
