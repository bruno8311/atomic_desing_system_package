import 'package:flutter/material.dart';

class AtomFAB extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final String? tooltip;

  const AtomFAB({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      tooltip: tooltip,
      child: child,
    );
  }
}
