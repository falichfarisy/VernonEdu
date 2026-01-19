import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';
import 'class_card.dart';

class SelesaiFragment extends StatelessWidget {
  const SelesaiFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        summaryBox(),
        const SizedBox(height: 16),
        const ClassCard(
          title: 'Public Speaking',
          level: 'Regular A',
          progress: 1.0, 
          color: CustomColor.success,
          username: 'Tanti Dwi ',
        ),
      ],
    );
  }

  Widget summaryBox() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColor.secondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: CustomColor.secondary, 
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/icons/info.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(CustomColor.textOnPrimary, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(
              '1', 
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.textOnPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Kelas telah Selesai',
              style: TextStyle(color: CustomColor.textOnPrimary),
            ),
          ],
        ),
      ),
    );
  }
}