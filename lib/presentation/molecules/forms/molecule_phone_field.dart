import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';

class MoleculePhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? helperText;
  final ValueChanged<String>? onChanged;

  const MoleculePhoneField({
    super.key,
    required this.controller,
    required this.label,
    this.helperText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomLabel(text: label),
        const SizedBox(height: 8),
        AtomInput(
          controller: controller,
          keyboardType: TextInputType.phone,
          hintText: 'Ej: +51 999 999 999',
          onChanged: onChanged,
        ),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AtomText(
              text: helperText!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
