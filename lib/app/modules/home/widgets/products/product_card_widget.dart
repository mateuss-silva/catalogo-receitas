import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_challenge_20210610/app/modules/home/widgets/products/product_slidable_widget.dart';
import 'package:food_challenge_20210610/app/shared/dialogs/product_dialogs.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:food_challenge_20210610/app/shared/stores/product_store.dart';
import 'package:food_challenge_20210610/app/shared/widgets/cached_network_image_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/default_image_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/rating_stars_widget.dart';
import 'package:intl/intl.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  void _onDelete() async {
    try {
      await _productStore.deleteProduct(widget.product);
      ProductDialogs.successfullyDeleted(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Erro ao deletar produto"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
  }

  final _productStore = Modular.get<ProductStore>();
  @override
  Widget build(BuildContext context) {
    return ProductSlidableWidget(
      key: ValueKey(widget.product.id),
      onEdit: (_) =>
          Modular.to.pushNamed('/product/edit', arguments: widget.product),
      onDelete: (_) => ProductDialogs.deletionConfirmation(
          context, widget.product, _onDelete),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              splashColor: Colors.blue.shade100,
              onTap: () {
                Modular.to.pushNamed('/product/', arguments: widget.product);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Hero(
                      tag: widget.product.id!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.product.imageUrl == null
                            ? const DefaultImageWidget(height: 100, width: 100)
                            : CachedNetworkImageWidget(
                                imageUrl: widget.product.imageUrl!,
                                key: ValueKey(widget.product.id!),
                                width: 100,
                                height: 100,
                              ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    _title(),
                                    const SizedBox(height: 4),
                                    _type(),
                                    const SizedBox(height: 4),
                                    _createdAt(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: TextButton(
                                  onPressed: () => _slipBehaviorAction(context),
                                  child: const Icon(Icons.more_horiz),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              RatingStartsWidget(rating: widget.product.rating),
                              const Spacer(),
                              _price(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _slipBehaviorAction(context) async {
    SlidableController? slidable = Slidable.of(context);
    bool _isOpen = (slidable!.actionPaneConfigurator?.extentRatio ?? 0) > 0;
    if (_isOpen) {
      await slidable.close();
    } else {
      await slidable.openEndActionPane();
    }
  }

  Text _price() {
    return Text(
      "R\$ ${widget.product.price}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[700],
      ),
    );
  }

  Text _type() {
    return Text(
      widget.product.type,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey[700],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _createdAt() {
    var formatter = DateFormat('dd/MM/yy');
    String date = widget.product.createdAt == null
        ? "indisponível"
        : formatter.format(widget.product.createdAt!);
    return Text(
      "Data de criação: $date",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.blueGrey[700],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _title() {
    return Text(
      widget.product.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey[700],
        fontSize: 16,
      ),
    );
  }
}
