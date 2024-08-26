import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/transactions/components/transaction_list.dart';
import 'package:klambi_admin/screens/profile/transactions/transaction_controller.dart';

import '../../../helper/constants.dart';

class TransactionScreenView extends GetView<TransactionController> {
  const TransactionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TransactionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/profile");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Pemasokan Transaksi",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
