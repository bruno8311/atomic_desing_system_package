import 'package:flutter/material.dart';

class AtomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  const AtomIcon({super.key, required this.icon, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color);
  }
}
