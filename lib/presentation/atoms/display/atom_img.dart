import 'package:flutter/material.dart';

class AtomImg extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;

  const AtomImg({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Widget img = Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: img,
      );
    }
    return img;
  }
}