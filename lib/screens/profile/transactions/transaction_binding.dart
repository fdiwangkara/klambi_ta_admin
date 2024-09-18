import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/profile_controller.dart';
import 'package:klambi_admin/screens/profile/transactions/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
          () => TransactionController(),
    );
  }
}