import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';

class MoleculeInputWithHelperText extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String helperText;
  const MoleculeInputWithHelperText({super.key, required this.label, required this.controller, required this.helperText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomLabel(text: label),
        AtomInput(controller: controller),
        AtomText(text: helperText, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
