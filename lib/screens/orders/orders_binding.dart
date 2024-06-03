import 'package:get/get.dart';
import 'package:klambi_admin/screens/orders/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
          () => OrdersController(),
    );
  }
}