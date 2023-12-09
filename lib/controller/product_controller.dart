import 'package:e_commerce_app/model/popular_product.dart';
import 'package:e_commerce_app/service/local_service/loca_popular_product_service.dart';
import 'package:e_commerce_app/service/remote_service/remote_product_grid_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditior = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;
  final LocalPopularProductService _localPopularProductService =
      LocalPopularProductService();

  @override
  void onInit() async {
    await _localPopularProductService.init();
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      if (_localPopularProductService.getPopularProduct().isNotEmpty) {
        productList.assignAll(_localPopularProductService.getPopularProduct());
      }
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListfromJson(result.body));
        _localPopularProductService.assignAllProduct(
            poularproduct: productListfromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByName(keyword: keyword);
      if (result != null) {
        productList.assignAll(productListfromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }

  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if (result != null) {
        productList.assignAll(productListfromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }
}
