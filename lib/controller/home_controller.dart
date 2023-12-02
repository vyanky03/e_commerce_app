import 'package:e_commerce_app/model/ad_banner.dart';
import 'package:e_commerce_app/model/category.dart';
import 'package:e_commerce_app/service/remote_service/remote_banner_service.dart';
import 'package:e_commerce_app/service/remote_service/remote_popular_category_serive.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxBool isBannerloading = false.obs;
  RxBool isPopuplarCategoryloading = false.obs;

  @override
  void onInit() {
    getAdBanner();
    getPopularCategories();
    super.onInit();
  }

  void getAdBanner() async {
    try {
      isBannerloading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {
      isBannerloading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopuplarCategoryloading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryFromJson(result.body));
      }
    } finally {
      isPopuplarCategoryloading(false);
    }
  }
}
