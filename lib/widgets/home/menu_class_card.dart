import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/constants/colors.dart';

class MenuClassCard extends StatelessWidget {
  const MenuClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20, left: 20, bottom: 12, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(icon: 'assets/icons/folder.svg', label: 'Kelas'),
            SizedBox(width: 34,),
            _menuItem(icon: 'assets/icons/education.svg', label: 'Fasilitator'),
          ],
        ),
      );
  }
}

Widget _menuItem({required String icon, required String label}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 26,
        backgroundColor: CustomColor.secondary,
        child: SvgPicture.asset(icon, width: 32),
      ),
      SizedBox(height: 2),
      Text(label, style: TextStyle(color: CustomColor.secondary, fontSize: 12)),
    ],
  );
}
