import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'default_image_widget.dart';
import 'rectangular_loading_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return DefaultImageWidget(height: height, width: width);
    }
    return CachedNetworkImage(
        imageUrl: imageUrl!,
        key: ValueKey(key),
        fit: BoxFit.cover,
        width: width,
        height: height,
        placeholder: (context, url) =>
            RectangularLoadingWidget(height: height, width: width),
        errorWidget: (context, url, error) =>
            DefaultImageWidget(height: height, width: width));
  }
}
