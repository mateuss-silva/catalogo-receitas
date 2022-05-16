import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final bool isDescription;
  final bool isRequired;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isDescription = false,
    this.isRequired = false,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: isRequired ? _required : validator,
      onChanged: onChanged,
      minLines: isDescription ? 3 : 1,
      maxLines: isDescription ? 3 : 1,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1),
        ),
      ),
    );
  }

  String? _required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo é obrigatório';
    }
    return null;
  }
  static String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo é obrigatório';
    }

    value = value.replaceAll("R\$ ", "").replaceAll(",", ".");
    var price = double.tryParse(value);

    if (price == 0) {
      return 'Campo é obrigatório';
    }

    return null;
  }
}
