import 'package:get/get.dart';
import 'package:klambi_admin/screens/orders/detail_orders/detail_orders_controller.dart';

class DetailOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOrdersController>(
          () => DetailOrdersController(),
    );
  }
}