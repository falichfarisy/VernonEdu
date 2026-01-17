import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/attendance/info_box.dart';

class AssesmentPage extends StatelessWidget {
  const AssesmentPage({super.key});

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
          'Assesment',
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

            const SizedBox(height: 8),

            Text(
              'Assesment Akhir',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: CustomColor.error,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Belum Dimulai',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.textOnPrimary,
                  ),
                ),
              ),
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
                  InfoBox('5', 'Jumlah Peserta'),
                  InfoBox('0', 'Sudah Dinilai'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 4 ? 0 : 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nama Peserta ${index + 1}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 190,
                          height: 45,
                          child: TextField(
                            enabled: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Nilai',
                              filled: true,
                              fillColor: CustomColor.textHint.withOpacity(0.2),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Unduh rekap penilaian',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: CustomColor.warning,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: CustomColor.warning,
                  child: SvgPicture.asset(
                    'assets/icons/download.svg',
                    width: 18,
                    colorFilter: const ColorFilter.mode(
                      CustomColor.textOnPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: CustomColor.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.textOnPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
