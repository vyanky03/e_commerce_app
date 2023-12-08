import 'package:e_commerce_app/component/main_header.dart';
import 'package:e_commerce_app/controller/controllers.dart';
import 'package:e_commerce_app/view/products/components/popular_loading_grid.dart';
import 'package:e_commerce_app/view/products/components/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(child: Obx(() {
            if (productController.isProductLoading.value) {
              return const ProductLoadingGrid();
            } else {
              if (productController.productList.isNotEmpty) {
                return ProductGrid(products: productController.productList);
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/Questions-amico.svg',
                        height: 300),
                    const Text(
                      'No Product Found!',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              }
            }
          })),
        ],
      ),
    );
  }
}
