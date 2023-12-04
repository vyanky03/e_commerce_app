import 'package:e_commerce_app/model/ad_banner.dart';
import 'package:hive/hive.dart';

class LocalAdBannerService {
  late Box<AdBanner> _adBannerBox;

  Future<void> init() async {
    _adBannerBox = await Hive.openBox<AdBanner>('AdBanners');
  }

  Future<void> assignAllBanners({required List<AdBanner> adBanners}) async {
    await _adBannerBox.clear();
    await _adBannerBox.addAll(adBanners);
  }

  List<AdBanner> getAdBanner() => _adBannerBox.values.toList();
}
