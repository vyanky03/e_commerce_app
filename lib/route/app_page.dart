import 'package:e_commerce_app/route/app_route.dart';
import 'package:e_commerce_app/view/dashboard/dashboard.dart';
import 'package:e_commerce_app/view/dashboard/dashboard_binding.dart';
import 'package:get/get.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashBoard(),
      binding: DashboardBinding(),
    ),
  ];
}
