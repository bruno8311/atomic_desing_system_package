import 'package:flutter/material.dart';
import '../../atoms/display/atom_text.dart';
import '../../atoms/buttons/atom_button.dart';

class MoleculeConfirmModal extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool expandButtons;

  const MoleculeConfirmModal({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Aceptar',
    this.cancelText = 'Cancelar',
    this.onConfirm,
    this.onCancel,
    this.expandButtons = false,
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Aceptar',
    String cancelText = 'Cancelar',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (context) => MoleculeConfirmModal(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget cancelBtn = Flexible(
      child: AtomButton(
        label: cancelText,
        type: AtomButtonType.danger,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        onPressed: () {
          Navigator.of(context).pop();
          if (onCancel != null) onCancel!();
        },
      ),
    );
    Widget confirmBtn = Flexible(
      child: AtomButton(
        label: confirmText,
        type: AtomButtonType.primary,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        onPressed: () {
          Navigator.of(context).pop();
          if (onConfirm != null) onConfirm!();
        },
      ),
    );
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
            AtomText(
              text: message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cancelBtn,
                const SizedBox(width: 12),
                confirmBtn,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
