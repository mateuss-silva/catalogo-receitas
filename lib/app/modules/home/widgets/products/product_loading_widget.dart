import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            dense: true,
            leading: Container(
              width: 60,
              height: 60,
              color: Colors.grey.shade300,
            ),
            title: Container(
              width: double.infinity,
              height: 30,
              color: Colors.grey.shade300,
            ),
            subtitle: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              height: 30,
              color: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}