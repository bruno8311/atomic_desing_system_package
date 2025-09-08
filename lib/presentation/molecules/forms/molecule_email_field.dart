import 'package:flutter/material.dart';

class MoleculeEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  const MoleculeEmailField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText ?? 'Email',
        hintText: hintText ?? 'Ingresa tu email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.email),
      ),
      validator: validator,
    );
  }
}
