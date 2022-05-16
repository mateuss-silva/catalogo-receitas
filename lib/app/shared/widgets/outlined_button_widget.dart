import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String label;

  const OutlinedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(side: BorderSide(color: color)),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: color,
        ),
      ),
    );
  }
}
