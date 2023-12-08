import 'package:e_commerce_app/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Obx(
                () => TextField(
                  autofocus: false,
                  controller: productController.searchTextEditior,
                  onSubmitted: (val) {
                    productController.getProductByName(keyword: val);
                    dashboardController.updateIndex(1);
                  },
                  onChanged: (val) {
                    productController.searchVal.value = val;
                    // productController.getProductByName(keyword: val);
                    // dashboardController.updateIndex(1);
                  },
                  decoration: InputDecoration(
                      suffixIcon: productController.searchVal.value.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                productController.searchTextEditior.clear();
                                productController.searchVal.value = '';
                                productController.gertProducts();
                              },
                              icon: const Icon(Icons.clear),
                              color: Colors.grey,
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const HeaderIcon(
            icon: Icon(
              Icons.filter_alt_off_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Badge.count(
            count: 1,
            textColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            child: const HeaderIcon(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
    required this.icon,
  });
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: icon,
    );
  }
}
