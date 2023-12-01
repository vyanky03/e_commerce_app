import 'package:e_commerce_app/model/ad_banner.dart';
import 'package:e_commerce_app/service/remote_service/remote_banner_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;

  RxBool isBannerloading = false.obs;

  @override
  void onInit() {
    getAdBanner();
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
      print(bannerList.length);
      isBannerloading(false);
    }
  }
}
