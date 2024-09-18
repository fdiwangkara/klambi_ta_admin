import 'package:get/get.dart';
import 'package:klambi_admin/screens/product/add_product/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
          () => AddProductController(),
    );
  }
}