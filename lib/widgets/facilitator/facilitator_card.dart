import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';
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

void showAddFacilitatorSheet(BuildContext context) {
  // Data Dummy Sesi
  List<Map<String, dynamic>> sessions = [
    {'id': 1, 'name': 'Sesi 1', 'isEnded': true, 'isSelected': false},
    {'id': 2, 'name': 'Sesi 2', 'isEnded': true, 'isSelected': false},
    {'id': 3, 'name': 'Sesi 3', 'isEnded': true, 'isSelected': false},
    {'id': 4, 'name': 'Sesi 4', 'isEnded': true, 'isSelected': false},
    {'id': 5, 'name': 'Sesi 5', 'isEnded': true, 'isSelected': false},
    {'id': 6, 'name': 'Sesi 6', 'isEnded': true, 'isSelected': false},
    {'id': 7, 'name': 'Sesi 7', 'isEnded': false, 'isSelected': false},
    {'id': 8, 'name': 'Sesi 8', 'isEnded': false, 'isSelected': false},
    {'id': 9, 'name': 'Sesi 9', 'isEnded': false, 'isSelected': false},
    {'id': 10, 'name': 'Sesi 10', 'isEnded': false, 'isSelected': false},
    {'id': 11, 'name': 'Sesi 11', 'isEnded': false, 'isSelected': false},
    {'id': 12, 'name': 'Sesi 12', 'isEnded': false, 'isSelected': false},
  ];

  String? selectedFacilitator;
  final List<String> facilitators = ["Budi Santoso", "Siti Aminah", "Rudi Hartono"];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: CustomColor.textOnPrimary,
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
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // handler bar
                Center(
                  child: Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300], borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // judul
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Assign Fasilitator',
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Public Speaking Regular A',
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 16),

                //Dropdown Fasilitator 
                Text('Pilih Fasilitator', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: CustomColor.textOnPrimary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedFacilitator,
                      hint: Text("Pilih Fasilitator", style: GoogleFonts.poppins(color: Colors.grey[400])),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down, 
                        color: CustomColor.secondary, 
                        size: 30,
                      ),
                      items: facilitators.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: GoogleFonts.poppins()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setModalState(() => selectedFacilitator = newValue);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //Grid pilih sesi
                Text('Pilih Sesi', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, 
                    childAspectRatio: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    // agar urutan ke bawah
                    // Total baris per kolom = 5 
                    int rowsPerColumn = 5; 
                    
                    // Rumus transpose index (ubah urutan horizontal jd vertikal)
                    int colIndex = index % 4;       // Kolom ke berapa (0, 1, atau 2)
                    int rowIndex = index ~/ 4;      // Baris ke berapa
                    
                    // Data yang diambil = (Kolom x JumlahBaris) + Baris
                    int dataIndex = (colIndex * rowsPerColumn) + rowIndex;

                    // Safety check biar gak error kalau indexnya kelebihan
                    if (dataIndex >= sessions.length) return const SizedBox();

                    final session = sessions[dataIndex]; // Pakai dataIndex hasil hitungan
                    bool isEnded = session['isEnded'];
                    bool isSelected = session['isSelected'];

                    return InkWell(
                      onTap: isEnded 
                          ? null 
                          : () {
                              setModalState(() {
                                // Update status data yang ASLI (pakai dataIndex)
                                sessions[dataIndex]['isSelected'] = !isSelected;
                              });
                            },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isEnded 
                                  ? CustomColor.textHint
                                  : (isSelected ? CustomColor.success : CustomColor.textOnPrimary),
                              borderRadius: BorderRadius.circular(6),
                              border: isEnded || isSelected 
                                  ? null 
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            child: isSelected 
                                ? const Icon(Icons.check, size: 16, color: CustomColor.textOnPrimary) 
                                : null,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            session['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // tombol assign
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Logika simpan: Loop sessions untuk cari yang 'isSelected' == true
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.secondary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Assign Fasilitator',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold, color: CustomColor.textOnPrimary),
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