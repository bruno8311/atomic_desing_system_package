import 'package:flutter/material.dart';

class AtomAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const AtomAvatar({super.key, required this.imageUrl, this.radius = 24});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(imageUrl)
    );
  }
}
