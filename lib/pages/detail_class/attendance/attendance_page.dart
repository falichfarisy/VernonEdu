import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/attendance/info_box.dart';
import 'package:vernon_edu/widgets/attendance/session_card.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

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
          'Presensi',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: CustomColor.textOnPrimary,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Public Speaking',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Reguler A',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),

            Row(
              children: [
                CircleAvatar(radius: 24, backgroundColor: CustomColor.textHint),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanti Nur Dwiyanti',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mentor - Communication',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: CustomColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColor.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoBox('12', 'Jumlah Sesi'),
                  InfoBox('7', 'Sesi Selesai'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ListView.builder(
              itemCount: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final selesai = index < 7;
                return SessionCard(
                  'Sesi ${index + 1}',
                  selesai ? '5 peserta hadir' : '5 peserta terdaftar',
                  selesai,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
