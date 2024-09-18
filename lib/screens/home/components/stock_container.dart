import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/orders/orders_controller.dart';
import '../../../helper/constants.dart';
import '../../product/product_controller.dart';

class StockContainer extends StatelessWidget {
  const StockContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final ProductController productController = Get.find<ProductController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 226,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: kLightGreyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Data Stok Barang - saat ini',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Obx(() => Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/box_yellow_icon.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Stok Tersedia',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                        ),
                        Text(
                          '${productController.totalStock} Pcs',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Divider(color: kLightGreyColor),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/box_green_icon.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Stok Diterima',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                        ),
                        Text(
                          '${productController.totalReceive} Pcs',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Divider(color: kLightGreyColor),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/box_red_icon.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Stok Terjual',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kDarkGreyColor,
                            ),
                          ),
                        ),
                        Text(
                          '${productController.totalSold} Pcs',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Divider(color: kLightGreyColor),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
