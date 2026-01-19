import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';

Widget SessionCard(String title, String subtitle, bool selesai) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: CustomColor.textOnPrimary,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: CustomColor.textPrimary.withOpacity(0.05),
          blurRadius: 8,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/user.svg',
                  width: 14,
                  height: 14,
                  color: CustomColor.textSecondary,
                ),

                const SizedBox(width: 6),

                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: CustomColor.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),

        CircleAvatar(
          radius: 18,
          backgroundColor: selesai ? CustomColor.success : CustomColor.warning,
          child: selesai
              ? SvgPicture.asset(
                  'assets/icons/check.svg',
                  color: CustomColor.textOnPrimary,
                )
              : SvgPicture.asset(
                  'assets/icons/clock.svg',
                  color: CustomColor.textOnPrimary,
                ),
        ),
      ],
    ),
  );
}
