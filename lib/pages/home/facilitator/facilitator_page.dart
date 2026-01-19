import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';
import 'package:vernon_edu/widgets/facilitator/facilitator_card.dart';

class FacilitatorPage extends StatelessWidget {
  const FacilitatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        titleSpacing: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/chevron-left.svg',
            width: 28,
            color: CustomColor.textOnPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Fasilitator',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: CustomColor.textOnPrimary,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Communication',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            Text(
              'Fasilitator (4)',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return FacilitatorCard(
                    context,
                    'Nama Fasilitator ${index + 1}',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.textPrimary,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
