import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/modules/product/product_controller.dart';
import 'package:food_challenge_20210610/app/modules/product/widgets/gradient_background.dart';
import 'package:food_challenge_20210610/app/shared/dialogs/product_dialogs.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:food_challenge_20210610/app/shared/widgets/back_button_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/cached_network_image_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/default_image_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/icon_button_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/rating_stars_widget.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends ModularState<ProductPage, ProductController> {
  @override
  void initState() {
    super.initState();
    controller.store.setProduct(widget.product);
  }

  void _onDelete() async {
    try {
      await controller.store.deleteProduct(widget.product);
      await ProductDialogs.successfullyDeleted(context);
      Modular.to.pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Erro ao deletar produto"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: GradientBackground.blueGradient(),
        child: SafeArea(
          child: StreamBuilder<Product>(
              stream: controller.store.productStream,
              initialData: widget.product,
              builder: (context, snapshot) {
                var product = snapshot.data ?? widget.product;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: Row(
                        children: [
                          const BackButtonWidget(),
                          const Spacer(),
                          IconButtonWidget(
                            icon: Icons.delete,
                            color: Colors.red,
                            onPressed: () {
                              ProductDialogs.deletionConfirmation(
                                context,
                                widget.product,
                                _onDelete,
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          IconButtonWidget(
                            icon: Icons.edit_note,
                            color: Colors.blue,
                            onPressed: () {
                              Modular.to.pushNamed('/product/edit',
                                  arguments: product);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        children: [
                          Hero(
                            tag: product.id!,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: product.imageUrl == null
                                  ? DefaultImageWidget(
                                      height: height, width: width)
                                  : CachedNetworkImageWidget(
                                      imageUrl: product.imageUrl!,
                                      key: ValueKey(product.id!),
                                      height: height,
                                      width: width,
                                    ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Chip(
                                label: Text(
                                  product.type,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingStartsWidget(rating: product.rating),
                                  Text(
                                    "R\$ ${product.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[700],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              _createdAt(product),
                              const SizedBox(height: 16),
                              const Text(
                                "Dimensões",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Largula: ${product.widthString.isEmpty ? "Não informado" : product.widthString}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Altura: ${product.heightString.isEmpty ? "Não informado" : product.heightString}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Descrição",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                product.description ?? "Indisponível",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Text _createdAt(product) {
    var formatter = DateFormat('dd/MM/yyyy');
    String date = product.createdAt == null
        ? "Indisponível."
        : formatter.format(product.createdAt!);
    return Text(
      "Data de criação: $date",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.blueGrey[700],
      ),
    );
  }
}
