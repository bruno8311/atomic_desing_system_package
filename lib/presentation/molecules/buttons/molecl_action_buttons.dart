import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';


class MoleculeActionButtons extends StatelessWidget {
  final List<String> labels;
  final List<VoidCallback> actions;
  final Axis direction;
  final double spacing;
  final MainAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;

  const MoleculeActionButtons({
    super.key,
    required this.labels,
    required this.actions,
    this.direction = Axis.horizontal,
    this.spacing = 2,
    this.alignment = MainAxisAlignment.start,
    this.padding,
  }) : assert(labels.length == actions.length);

@override
  Widget build(BuildContext context) {

    final isValidButtons = labels.length == actions.length;
    if (!isValidButtons) return const SizedBox.shrink();

    final listButtons = List.generate(labels.length, (i) => AtomButton(
      label: labels[i],
      onPressed: actions[i],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
    )).map(
          (button) => [
            button,
            SizedBox(
              width: direction == Axis.horizontal ? spacing : 0,
              height: direction == Axis.vertical ? spacing : 0
            )
          ])
        .expand((widgets) => widgets)
        .toList();
    if (listButtons.isNotEmpty) {
      listButtons.removeLast();
    }
  
    final content = direction == Axis.horizontal
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: alignment, children: listButtons),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(mainAxisAlignment: alignment, children: listButtons),
          );
    return padding != null ? Padding(padding: padding!, child: content) : content;
  }
}

