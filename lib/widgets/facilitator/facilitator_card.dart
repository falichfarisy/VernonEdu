import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/facilitator/class_card.dart';

Widget FacilitatorCard(
  BuildContext context,
  String name, {
  required TextStyle style,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: CustomColor.textOnPrimary,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: CustomColor.textPrimary.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: CustomColor.textHint,
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                showDetailBottomSheet(context);
              },
              child: Text(
                'Lihat Detail',
                style: GoogleFonts.poppins(
                  fontSize: 14,
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

void showDetailBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: CustomColor.textHint,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: Text(
                'Detail Fasilitator',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.textPrimary,
                ),
              ),
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),

            Text(
              'Kelas Fasilitator',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            ClassCard('Aku Bisa MC - Regular A', 'Sesi 1 - Sesi 2'),

            ClassCard('Public Speaking - Regular B', 'Sesi 2 - Sesi 3'),

            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

void showAssignFacilitatorSheet(BuildContext context) {
  // Variabel lokal untuk menampung pilihan dropdown
  String? selectedFacilitator;

  // Data dummy fasilitator
  final List<String> facilitators = [
    "Siti Aminah",
    "RA Kartini",
    "Dewi Sartika",
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Supaya kalau ada keyboard, sheet-nya naik
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16,
              // Ini supaya padding bawah menyesuaikan keyboard/layar
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Tinggi menyesuaikan isi
              children: [
                // 1. Handle Bar (Garis abu-abu kecil di atas)
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),

                // 2. Judul & Subjudul
                Text(
                  'Assign Fasilitator',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.textPrimary, 
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sesi 8',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: CustomColor.textSecondary
                  ),
                ),

                const SizedBox(height: 16),
                const Divider(), // Garis pemisah tipis
                const SizedBox(height: 16),

                // 3. Label & Dropdown
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pilih Fasilitator',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Dropdown Input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F8FA), // Warna blm sesuai
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedFacilitator,
                      hint: Text(
                        "Pilih Fasilitator",
                        style: GoogleFonts.poppins(color: Colors.grey[400]),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: CustomColor.secondary,
                      ),
                      isExpanded: true, // Supaya lebar penuh
                      items: facilitators.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        // Update state khusus modal ini
                        setModalState(() {
                          selectedFacilitator = newValue;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Tombol Assign
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //print("Fasilitator terpilih: $selectedFacilitator");
                      Navigator.pop(context); // Tutup modal
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          CustomColor.secondary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Assign Fasilitator',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textOnPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      );
    },
  );
}
