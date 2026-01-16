import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/models/information_class_model.dart';

class ClassInformationCard extends StatelessWidget {
  final InformationClassModel data;

  const ClassInformationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: CustomColor.textSecondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.className.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: CustomColor.textOnPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.countdownText,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(color: CustomColor.textOnPrimary, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.eventName,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                /// Info Row
                _infoRow(Icons.lock_clock, '${data.tanggal} '),
                const SizedBox(height: 4),
                _infoRow(Icons.confirmation_number, 'Sesi ${data.sesi}'),
                const SizedBox(height: 4),
                _infoRow(Icons.location_on, data.location),
                const SizedBox(height: 4),
                _infoRow(Icons.people, '${data.perserta} peserta'),
              ],
            ),
          ),

          /// Tanggal
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: CustomColor.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: GoogleFonts.poppins(fontSize: 12))),
        ],
      ),
    );
  }
}
