import 'package:e_commerce_app/component/main_header.dart';
import 'package:e_commerce_app/controller/controllers.dart';
import 'package:e_commerce_app/view/home/components/caraousel_slider/caraousel_loading.dart';
import 'package:e_commerce_app/view/home/components/caraousel_slider/caraousel_slider_view.dart';
import 'package:e_commerce_app/view/home/components/popular_category/popular_category_loading.dart';
import 'package:e_commerce_app/view/home/components/popular_category/popular_category.dart';
import 'package:e_commerce_app/view/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Obx(() {
            if (homeController.bannerList.isNotEmpty) {
              return CaraouselSliderView(bannerList: homeController.bannerList);
            } else {
              return const CarouselLoading();
            }
          }),
          const SectionTitle(title: 'Popular Category'),
          Obx(() {
            if (homeController.popularCategoryList.isNotEmpty) {
              return PopularCategory(
                categories: homeController.popularCategoryList,
              );
            } else {
              return const PopularCategoryLoading();
            }
          }),
        ],
      ),
    );
  }
}
