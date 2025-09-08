import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:atomic_desing_system_package/presentation/molecules/molecules.dart';

class OrganismLoginForm extends StatefulWidget {
  final void Function(String email, String password)? onLogin;
  final void Function()? onForgotPassword;

  const OrganismLoginForm({
    super.key,
    this.onLogin,
    this.onForgotPassword,
  });

  @override
  State<OrganismLoginForm> createState() => _OrganismLoginFormState();
}

class _OrganismLoginFormState extends State<OrganismLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MoleculeEmailField(controller: _emailController),
              const SizedBox(height: 16),
              MoleculePasswordField(controller: _passwordController),
              const SizedBox(height: 8),
              MoleculeLinkForgotPassword(onTap: widget.onForgotPassword),
              const SizedBox(height: 24),
              AtomButton(
                label: 'Iniciar sesión',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onLogin?.call(
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
