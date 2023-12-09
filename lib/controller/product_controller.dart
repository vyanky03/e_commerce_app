import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/service/local_service/loca_popular_product_service.dart';
import 'package:e_commerce_app/service/remote_service/remote_product_grid_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {
    await _localProductService.init();
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      if (_localProductService.getProducts().isNotEmpty) {
        productList.assignAll(_localProductService.getProducts());
      }
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
        _localProductService.assignAllProducts(
            products: productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByName(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }

  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }
}
