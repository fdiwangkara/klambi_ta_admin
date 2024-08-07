import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/product_card.dart';
import '../product_controller.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(
            () => productController.isLoading.value
            ? Center(child: CircularProgressIndicator()) // Center the CircularProgressIndicator
            : GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.8,
          ),
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
                product: productController.productList[index]);
          },
        ),
      ),
    );
  }
}
