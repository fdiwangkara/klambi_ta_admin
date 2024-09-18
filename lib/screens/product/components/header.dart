import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/constants.dart';
import '../product_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Semua Produk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: width / 2.5,
            height: 36,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              border: Border.all(
                color: kLightGreyColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Obx(
                  () => DropdownButtonHideUnderline(
                child: Center(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: productController.selectedCategory.value,
                    items: productController.categoryList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: productController.onCategoryChanged,
                    alignment: Alignment.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: kBlackColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
