import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';

class MoleculeDateField extends StatefulWidget {
  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime?>? onChanged;
  final String? helperText;

  const MoleculeDateField({
    super.key,
    required this.label,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.helperText,
  });

  @override
  State<MoleculeDateField> createState() => _MoleculeDateFieldState();
}

class _MoleculeDateFieldState extends State<MoleculeDateField> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomLabel(text: widget.label),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: widget.firstDate ?? DateTime(1900),
              lastDate: widget.lastDate ?? DateTime(2100),
            );
            if (picked != null) {
              setState(() => selectedDate = picked);
              if (widget.onChanged != null) widget.onChanged!(picked);
            }
          },
          child: AtomInput(
            controller: TextEditingController(
              text: selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : '',
            ),
            enabled: false,
            hintText: 'Selecciona una fecha',
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
        if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AtomText(
              text: widget.helperText!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
