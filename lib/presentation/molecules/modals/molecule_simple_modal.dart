import 'package:flutter/material.dart';
import '../../atoms/display/atom_text.dart';
import '../../atoms/buttons/atom_button.dart';

class MoleculeSimpleModal extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback? onClose;

  const MoleculeSimpleModal({
    super.key,
    required this.title,
    required this.content,
    this.buttonText = 'Cerrar',
    this.onClose,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String content,
    String buttonText = 'Cerrar',
    VoidCallback? onClose,
  }) {
    return showDialog(
      context: context,
      builder: (context) => MoleculeSimpleModal(
        title: title,
        content: content,
        buttonText: buttonText,
        onClose: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AtomText(
              text: title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            AtomText(text: content, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            AtomButton(
              label: buttonText,
              onPressed: () {
                Navigator.of(context).pop();
                if (onClose != null) onClose!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
