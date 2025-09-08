import 'package:flutter/material.dart';

class MoleculeLinkForgotPassword extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const MoleculeLinkForgotPassword({
    super.key,
    this.onTap,
    this.text = '¿Olvidaste tu contraseña?',
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
