import 'package:get/get.dart';
import 'package:klambi_admin/screens/product/edit_product/edit_product_controller.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(
          () => EditProductController(),
    );
  }
}