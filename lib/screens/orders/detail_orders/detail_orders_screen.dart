import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/orders/detail_orders/components/receipt.dart';
import 'package:klambi_admin/screens/orders/detail_orders/detail_orders_controller.dart';
import 'package:klambi_admin/screens/product/add_product/components/add_form.dart';

class DetailOrdersScreenView extends GetView<DetailOrdersController> {
  const DetailOrdersScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailOrdersController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
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
            color: kBlackColor  ,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            Receipt(),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Pesanan Selesai',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDangerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: kWhiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
