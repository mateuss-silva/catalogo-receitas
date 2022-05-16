import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/modules/home/home_controller.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/navigation_bar_widget.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/products/product_error_widget.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/products/product_loading_widget.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/products/products_listview_widget.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _pageController = PageController(initialPage: 1);

  bool _awaitingProducts(bool hasData, ConnectionState connectionState) {
    return !hasData || connectionState == ConnectionState.waiting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: const NavigationBarWidget(),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            Container(),
            StreamBuilder<List<Product>>(
              stream: controller.products,
              builder: (context, snapshot) {
                bool _loading = _awaitingProducts(
                    snapshot.hasData, snapshot.connectionState);
                if (snapshot.hasError) {
                  return const ProductErrorWidget();
                }

                if (_loading) {
                  return const ProductLoadingWidget();
                }

                List<Product> products = snapshot.data!;

                return ProductsListViewWidget(products: products);
              },
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
