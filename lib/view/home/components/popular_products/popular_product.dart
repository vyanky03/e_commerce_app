import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/view/home/components/popular_products/popular_product_card.dart';
import 'package:flutter/material.dart';

class PopularProuduct extends StatelessWidget {
  const PopularProuduct({super.key, required this.popularProduct});

  final List<Product> popularProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: popularProduct.length,
          itemBuilder: (context, index) => PopularProductCard(
                product: popularProduct[index],
              )),
    );
  }
}
