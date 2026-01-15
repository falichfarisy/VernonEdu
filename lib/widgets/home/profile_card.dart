import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/sample_profile.jpg'),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Pagi',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: CustomColor.textOnPrimary,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Tanti Nur Dwiyanti',
              style: GoogleFonts.poppins(
                color: CustomColor.textOnPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Mentor - Communication',
              style: GoogleFonts.poppins(
                color: CustomColor.textOnPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
