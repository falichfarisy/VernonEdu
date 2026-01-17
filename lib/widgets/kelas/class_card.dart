import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:vernon_edu/pages/detail_class/detail_class_page.dart';

class ClassCard extends StatelessWidget {
  final String title;
  final String username;
  final String level;
  final double progress;
  final Color color;
  final bool showPercent;
  final DateTime? startDate;

  const ClassCard({
    super.key,
    required this.title,
    required this.username,
    required this.level,
    this.progress = 0.0,
    this.color = Colors.amber,
    this.showPercent = true,
    this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailClassPage(username: username, role: 'Mentor'),));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JUDUL
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/folder-dark.svg',
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    level,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // TAMPILKAN TANGGAL ATAU PROGRESS + PERSENTASE DI ATAS KANAN
              if (startDate != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Mulai pada ${DateFormat('d MMMM yyyy').format(startDate!)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                )
              else ...[
                if (showPercent)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress,
                  color: color,
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
