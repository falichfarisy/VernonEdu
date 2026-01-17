import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';

Widget InfoBox(String value, String label) {
  return Container(
    width: 360,
    height: 140,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: CustomColor.secondary,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/info.svg',
          width: 26,
          height: 26,
          color: CustomColor.textOnPrimary,
        ),

        const SizedBox(height: 8),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: value,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.textOnPrimary,
                ),
              ),
              TextSpan(
                text: ' dari 12',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.textOnPrimary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: CustomColor.textOnPrimary,
          ),
        ),
      ],
    ),
  );
}
