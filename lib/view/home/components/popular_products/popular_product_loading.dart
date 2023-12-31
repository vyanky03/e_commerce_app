import 'package:e_commerce_app/view/home/components/popular_products/popular_products_loading_card.dart';
import 'package:flutter/widgets.dart';

class PopularProductLoading extends StatelessWidget {
  const PopularProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const PopularProductsLoadingCard()),
    );
  }
}
