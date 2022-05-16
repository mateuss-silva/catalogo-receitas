import 'package:flutter/material.dart';

class DefaultImageWidget extends StatelessWidget{
  final double? height;
  final double? width;

  const DefaultImageWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFDFE6ED),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
            size: 32,
          ),
          const SizedBox(height: 4),
          Text(
            "Imagem indisponível",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}