import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/module/info_box.dart';
import 'package:vernon_edu/widgets/module/module_file_item.dart';
import 'package:vernon_edu/widgets/module/module_session_card.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({super.key});

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
          'Modul',
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

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColor.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [InfoBox('10', 'Modul Telah Diunggah')],
              ),
            ),

            const SizedBox(height: 24),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) {
                final uploaded = index < 10;

                return ModuleSessionCard(
                  title: 'Sesi ${index + 1}',
                  uploaded: uploaded,
                  child: uploaded && index == 0
                      ? const ModuleFileItem(fileName: 'Nama materi sesi 1.pdf')
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
