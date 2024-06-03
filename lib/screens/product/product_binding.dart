import 'package:get/get.dart';
import 'package:klambi_admin/screens/product/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
          () => ProductController(),
    );
  }
}