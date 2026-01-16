import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';

class ModuleFileItem extends StatelessWidget {
  final String fileName;

  const ModuleFileItem({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CustomColor.textHint.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(fileName, style: GoogleFonts.poppins(fontSize: 12)),
        ),
        const Spacer(),

        CircleAvatar(
          radius: 16,
          backgroundColor: CustomColor.warning,
          child: SvgPicture.asset(
            'assets/icons/pencil.svg',
            width: 10,
            height: 10,
            color: CustomColor.textOnPrimary,
          ),
        ),
        const SizedBox(width: 8),

        CircleAvatar(
          radius: 16,
          backgroundColor: CustomColor.warning,
          child: SvgPicture.asset(
            'assets/icons/download.svg',
            width: 10,
            height: 10,
            color: CustomColor.textOnPrimary,
          ),
        ),
      ],
    );
  }
}
