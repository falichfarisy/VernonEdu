import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'class_card.dart';

class AktifFragment extends StatelessWidget {
  const AktifFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        summarySection(),
        const SizedBox(height: 16),
        const ClassCard(
          title: 'Public Speaking',
          level: 'Regular A',
          progress: 0.09,
          username: 'Tanti Nur Dwiyanti',
          color: CustomColor.warning,
        ),
        const ClassCard(
          title: 'Public Speaking',
          level: 'Regular B',
          progress: 0.09,
          username: 'Tanti Nur Dwiyanti',
          color: CustomColor.warning,
        ),
        const ClassCard(
          title: 'Aku Bisa MC',
          level: 'Regular A',
          progress: 0.5,
          username: 'Tanti Nur Dwiyanti',
          color: CustomColor.warning,
        ),
      ],
    );
  }

  // ================= SUMMARY SECTION =================

  Widget summarySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColor.secondary.withOpacity(0.5), // 🔵 BIRU MUDA (GABUNG)
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: summaryInnerBox(
              value: '2', // ← Jumlah kelas oleh mentor
              label: 'Kelas oleh Mentor',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: summaryInnerBox(
              value: '1', // ← Jumlah kelas oleh fasilitator
              label: 'Kelas oleh Fasilitator',
            ),
          ),
        ],
      ),
    );
  }

  // ================= BIRU TUA =================

  Widget summaryInnerBox({required String value, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: CustomColor.secondary, // 🔷 BIRU TUA
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/info.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              CustomColor.textOnPrimary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColor.textOnPrimary,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
