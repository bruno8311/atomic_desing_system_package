import 'package:flutter/material.dart';

class AtomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  const AtomRadio({super.key, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged);
  }
}
