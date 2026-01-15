import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'class_card.dart';

class MendatangFragment extends StatelessWidget {
  const MendatangFragment({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy kelas mendatang
    final List<ClassData> upcomingClasses = [
      ClassData(
        title: 'Podcast',
        level: 'Regular A',
        startDate: DateTime(2025, 12, 10),
      ),
      ClassData(
        title: 'Podcast',
        level: 'Regular B',
        startDate: DateTime(2026, 1, 1),
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        summaryBox(upcomingClasses.length),
        const SizedBox(height: 16),
        ...upcomingClasses
            .map(
              (cls) => ClassCard(
                title: cls.title,
                level: cls.level,
                progress: 0,
                showPercent: false,
                startDate: cls.startDate, // ← tambahkan ini ke ClassCard
              ),
            )
            .toList(),
      ],
    );
  }

  Widget summaryBox(int count) {
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
              colorFilter: ColorFilter.mode(
                CustomColor.textOnPrimary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$count', // ← Angka dinamis
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.textOnPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text('Kelas Mendatang', style: TextStyle(color: CustomColor.textOnPrimary)),
          ],
        ),
      ),
    );
  }
}

// 🔹 Kelas bantu untuk menyimpan data kelas
class ClassData {
  final String title;
  final String level;
  final DateTime startDate;

  ClassData({
    required this.title,
    required this.level,
    required this.startDate,
  });
}
