import 'package:flutter/material.dart';
import '../templates/template_login_page.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateLoginPage(
      title: 'Bienvenido',
      subtitle: 'Inicia sesión para continuar',
      showBackArrow: true,
      onLogin: (email, password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login: $email / $password')),
      );
      },
      onForgotPassword: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Olvidaste tu contraseña')),
      );
      },
    );
  }
}