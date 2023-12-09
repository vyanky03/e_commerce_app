import 'package:e_commerce_app/model/ad_banner.dart';
import 'package:e_commerce_app/model/category.dart';
import 'package:e_commerce_app/model/popular_product.dart';
import 'package:e_commerce_app/service/local_service/loca_popular_product_service.dart';
import 'package:e_commerce_app/service/local_service/local_ad_banner_service.dart';
import 'package:e_commerce_app/service/local_service/local_category_service.dart';
import 'package:e_commerce_app/service/remote_service/popular_product_service.dart';
import 'package:e_commerce_app/service/remote_service/remote_banner_service.dart';
import 'package:e_commerce_app/service/remote_service/remote_popular_category_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerloading = false.obs;
  RxBool isPopuplarCategoryloading = false.obs;
  RxBool isPopuplarProductloading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _categoryService = LocalCategoryService();
  final LocalPopularProductService _poularProductService =
      LocalPopularProductService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _categoryService.init();
    await _poularProductService.init();
    getAdBanner();
    getPopularCategories();

    super.onInit();
  }

  void getAdBanner() async {
    //assigning local ad banner before calling api
    if (_localAdBannerService.getAdBanner().isNotEmpty) {
      bannerList.assignAll(_localAdBannerService.getAdBanner());
    }
    try {
      isBannerloading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db
        _localAdBannerService.assignAllBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerloading(false);
    }
  }

  void getPopularCategories() async {
    //assigning local category before calling api
    if (_categoryService.getCategory().isNotEmpty) {
      popularCategoryList.assignAll(_categoryService.getCategory());
    }
    try {
      isPopuplarCategoryloading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryFromJson(result.body));
        //save api result to local db
        _categoryService.assignAllCategory(
            category: popularCategoryFromJson(result.body));
      }
    } finally {
      isPopuplarCategoryloading(false);
    }
  }

  void getPopularProducts() async {
    //assigning local popular product before calling api
    if (_poularProductService.getProduct().isNotEmpty) {
      popularProductList.assignAll(_poularProductService.getProduct());
    }
    try {
      isPopuplarProductloading(true);
      var result = await RemotePopularProductService().get();
      if (result != null) {
        popularProductList.assignAll(popularProductListfromJson(result.body));
        //save api result to local db
        _poularProductService.assignAllPopularProduct(
            product: popularProductListfromJson(result.body));
      }
    } finally {
      // print(popularProductList.length);
      isPopuplarProductloading(false);
    }
  }
}
