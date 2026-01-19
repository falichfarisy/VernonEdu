import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';

class AppbarCustom extends StatelessWidget {
  final String title;

  const AppbarCustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColor.primary,
      titleSpacing: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/chevron-left.svg',
          width: 32,
          color: CustomColor.textOnPrimary,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: CustomColor.textOnPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
