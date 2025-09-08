import 'package:flutter/material.dart';

class MoleculePasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  const MoleculePasswordField({
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
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText ?? 'Contraseña',
        hintText: hintText ?? 'Ingresa tu contraseña',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.lock),
      ),
      validator: validator,
    );
  }
}
