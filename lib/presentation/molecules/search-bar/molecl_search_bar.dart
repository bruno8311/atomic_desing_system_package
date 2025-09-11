import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';

class MoleculeSearchBar extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final void Function(String)? onSearch;
  final IconData icon;
  final String? hintText;

  const MoleculeSearchBar({
    super.key,
    this.label,
    required this.controller,
    this.onSearch,
    this.icon = Icons.search,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty) ...[
          AtomLabel(text: label!),
          const SizedBox(height: 8),
        ],
        Container(
          constraints: const BoxConstraints(maxHeight: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AtomInput(
                    controller: controller,
                    hintText: hintText,
                    style: const TextStyle(fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: AtomIcon(icon: icon, color: Colors.grey[700]),
                onPressed: onSearch != null
                    ? () => onSearch!(controller.text)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}