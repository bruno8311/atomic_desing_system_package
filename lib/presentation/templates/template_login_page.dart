import 'package:flutter/material.dart';
import '../organisms/organism.dart';

class TemplateLoginPage extends StatelessWidget {
  final void Function(String email, String password)? onLogin;
  final void Function()? onForgotPassword;
  final String? title;
  final String? subtitle;
  final bool showBackArrow;

  const TemplateLoginPage({
    super.key,
    this.onLogin,
    this.onForgotPassword,
    this.title,
    this.subtitle,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Text(title!, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 24),
                        child: Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    OrganismLoginForm(
                      onLogin: onLogin,
                      onForgotPassword: onForgotPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showBackArrow)
            Positioned(
              top: 16,
              left: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
