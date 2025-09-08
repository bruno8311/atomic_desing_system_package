import 'package:flutter/material.dart';

class AtomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final Color? shadowColor;
  final bool? borderOnForeground;

  const AtomCard({
    super.key,
    required this.child,
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.borderOnForeground,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      shape: shape,
      margin: margin,
      clipBehavior: clipBehavior,
      shadowColor: shadowColor,
      borderOnForeground: borderOnForeground ?? true,
      child: child,
    );
  }
}
