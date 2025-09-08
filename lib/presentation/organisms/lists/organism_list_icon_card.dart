import 'package:flutter/material.dart';

import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';
import '../../molecules/molecules.dart';


class OrganismListIconCard extends StatelessWidget {
  final String? headerTitle;
  final List<IconData> icons;
  final List<String> titles;
  final List<String> subtitles;
  final List<VoidCallback>? onTaps;

  const OrganismListIconCard({
    super.key,
    this.headerTitle,
    required this.icons,
    required this.titles,
    required this.subtitles,
    this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerTitle != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              headerTitle!,
              style: AppTextStyles.title,
            ),
          ),
        ],
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: titles.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return MoleculeIconCard(
              icon: icons[index],
              title: titles[index],
              subtitle: subtitles[index],
              onTap: onTaps != null ? onTaps![index] : null,
            );
          },
        ),
      ],
    );
  }
}
