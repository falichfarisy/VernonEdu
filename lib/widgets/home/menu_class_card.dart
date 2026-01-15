import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/constants/colors.dart';

class MenuClassCard extends StatelessWidget {
  final List<MenuItemData> items;
  final double spacing;

  const MenuClassCard({
    super.key,
    required this.items,
    this.spacing = 20, // default spacing between items
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Row(
            children: [
              _MenuItem(icon: item.icon, label: item.label),
              if (index != items.length - 1) SizedBox(width: spacing),
            ],
          );
        }),
      ),
    );
  }
}

class MenuItemData {
  final String label;
  final String icon;

  MenuItemData({required this.label, required this.icon});
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: CustomColor.secondary,
          child: SvgPicture.asset(icon, width: 32, height: 32),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: CustomColor.secondary, fontSize: 12),
        ),
      ],
    );
  }
}
