import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/constants/colors.dart';

class MenuClassCard extends StatelessWidget {
  final List<MenuItemData> items;
  final double spacing;

  const MenuClassCard({
    super.key,
    required this.items,
    this.spacing = 20, // spacing between items
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full width
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ), // spacing outside
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ), // padding inside
      decoration: BoxDecoration(
        color: Colors.white, // white background
        borderRadius: BorderRadius.circular(20), // rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4), // shadow offset
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Row(
            children: [
              _MenuItem(icon: item.icon, label: item.label, page: item.page,),
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
  final Widget page;

  MenuItemData({
    required this.label, 
    required this.icon, 
    required this.page
  });
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final String label;
  final Widget page;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: CustomColor.secondary,
            child: SvgPicture.asset(icon, width: 32, height: 32),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: CustomColor.secondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

