import 'package:flutter/material.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/products/product_card_widget.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';

class ProductsListViewWidget extends StatelessWidget {
  final List<Product> products;
  const ProductsListViewWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        return Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ProductCardWidget(product: product));
      },
    );
  }
}
