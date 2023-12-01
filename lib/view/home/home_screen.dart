import 'package:e_commerce_app/component/main_header.dart';
import 'package:e_commerce_app/controller/controllers.dart';
import 'package:e_commerce_app/view/home/components/caraousel_slider/caraousel_loading.dart';
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
            if (homeController.isBannerloading.value) {
              return const CarouselLoading();
            } else {
              return const CarouselLoading();
            }
          }),
        ],
      ),
    );
  }
}
