import 'package:e_commerce_app/model/popular_product.dart';
import 'package:e_commerce_app/service/remote_service/remote_product_grid_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    gertProducts();
    super.onInit();
  }

  void gertProducts() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListfromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }
}
