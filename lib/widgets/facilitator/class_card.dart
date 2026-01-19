import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';

Widget ClassCard(String title, String subtitle) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: CustomColor.textOnPrimary,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: CustomColor.textHint,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: CustomColor.textPrimary,
          ),
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/folder.svg',
              width: 14,
              height: 14,
              color: CustomColor.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: CustomColor.textSecondary,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
