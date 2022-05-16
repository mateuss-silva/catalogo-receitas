import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:food_challenge_20210610/app/shared/models/product.dart';

class ProductDialogs {
  static void deletionConfirmation(
      context,  Product product,Function() onConfirm) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      headerAnimationLoop: false,
      padding: EdgeInsets.zero,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Deletar o produto "${product.title}"?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () => Modular.to.pop(),
                  child: const Text('Cancelar',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))),
              const Spacer(),
              const VerticalDivider(thickness: 1),
              const Spacer(),
              TextButton(
                onPressed: () {
                  onConfirm();
                  Modular.to.pop();
                },
                child: const Text(
                  'Confirmar',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
    ).show();
  }

  static Future<void> successfullyDeleted(context) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      headerAnimationLoop: false,
      autoDismiss: true,
      autoHide: const Duration(seconds: 3),
      title: "Produto excluído com sucesso!",
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ).show();
  }
  static Future<void> successfullyUpdated(context) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      headerAnimationLoop: false,
      autoDismiss: true,
      autoHide: const Duration(seconds: 3),
      title: "Produto atualizado com sucesso!",
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ).show();
  }
}
