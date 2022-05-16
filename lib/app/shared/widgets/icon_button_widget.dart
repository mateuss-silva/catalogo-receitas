import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final Color color;
  const IconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Icon(
          icon,
          size: 28,
          color: color,
        ),
      ),
    );
  }
}
