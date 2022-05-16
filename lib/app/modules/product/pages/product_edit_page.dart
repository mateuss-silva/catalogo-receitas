import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/modules/product/controllers/product_edit_controller.dart';
import 'package:food_challenge_20210610/app/modules/product/widgets/gradient_background.dart';
import 'package:food_challenge_20210610/app/modules/product/widgets/input_text_widget.dart';
import 'package:food_challenge_20210610/app/shared/dialogs/product_dialogs.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';
import 'package:food_challenge_20210610/app/shared/widgets/back_button_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/cached_network_image_widget.dart';
import 'package:food_challenge_20210610/app/shared/widgets/outlined_button_widget.dart';

class ProductEditPage extends StatefulWidget {
  final Product product;
  const ProductEditPage({Key? key, required this.product}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState
    extends ModularState<ProductEditPage, ProductEditController> {
  @override
  void initState() {
    super.initState();

    _setControllersInitialValues();
    controller.productStore.setInitialValues(widget.product);
  }

  void _setControllersInitialValues() {
    _titleController.text = widget.product.title;
    _priceController.text = widget.product.priceString;
    _typeController.text = widget.product.type;
    _descriptionController.text = widget.product.description ?? "";
    _heightController.text = widget.product.heightString;
    _widthController.text = widget.product.widthString;
  }

  final _formKey = GlobalKey<FormState>();
  
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _typeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _heightController = TextEditingController();
  final _widthController = TextEditingController();

  _onSave() async {
    try {
      var isValid = _formKey.currentState!.validate();
      if (isValid) {
        await controller.productStore.updateProduct();
        await ProductDialogs.successfullyUpdated(context);
        Modular.to.pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Erro ao salvar produto"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.2;
    var product = widget.product;

    return Scaffold(
      body: Container(
        decoration: GradientBackground.blueGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButtonWidget(),
                    ),
                    Text(
                      'Editar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    Observer(builder: (_) {
                      var image = controller.productStore.image;
                      var imageWidget = image != null
                          ? Image.file(
                              image,
                              fit: BoxFit.cover,
                              height: height,
                              width: height,
                            )
                          : CachedNetworkImageWidget(
                              imageUrl: product.imageUrl,
                              key: ValueKey(product.id!),
                              height: height,
                              width: height,
                            );
                      return InkWell(
                        onTap: controller.productStore.selectImage,
                        child: Hero(
                          tag: product.id!,
                          child: CircleAvatar(
                            radius: height / 2,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(child: imageWidget),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 4),
                    Align(
                      child: TextButton(
                        onPressed: controller.productStore.selectImage,
                        child: Text(
                          "Alterar foto",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _titleController,
                            label: 'Título',
                            hint: "Maça",
                            onChanged: controller.productStore.setTitle,
                            isRequired: true,
                          ),
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _typeController,
                            label: 'Tipo',
                            hint: "fruta",
                            onChanged: controller.productStore.setType,
                            isRequired: true,
                          ),
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _priceController,
                            label: 'Preço',
                            hint: "R\$ 10,50",
                            onChanged: controller.productStore.setPrice,
                            keyboardType: TextInputType.number,
                            validator: InputTextWidget.priceValidator,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TextInputMask(
                                mask: 'R!\$! !9+,99',
                                reverse: true,
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _descriptionController,
                            label: 'Descrição',
                            hint: "Maça vermelha com sabor alegre",
                            isDescription: true,
                            onChanged: controller.productStore.setDescription,
                          ),
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _heightController,
                            label: 'Altura (cm)',
                            hint: "30",
                            onChanged: controller.productStore.setHeight,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 16),
                          InputTextWidget(
                            controller: _widthController,
                            label: 'largura (cm)',
                            hint: "30",
                            onChanged: controller.productStore.setWidth,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Observer(builder: (_) {
                  if (controller.productStore.isSaving) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(strokeWidth: 6),
                    ));
                  }
                  return Row(
                    children: [
                      const Spacer(flex: 2),
                      OutlinedButtonWidget(
                        onPressed: () => Modular.to.pop(),
                        label: 'Cancelar',
                        color: Colors.red,
                      ),
                      const Spacer(),
                      OutlinedButtonWidget(
                        onPressed: _onSave,
                        label: 'Salvar',
                        color: Colors.blue,
                      ),
                      const Spacer(flex: 2),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
