import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/pages/detail_class/assesment/assesment_page.dart';
import 'package:vernon_edu/pages/detail_class/attendance/attendance_page.dart';
import 'package:vernon_edu/pages/detail_class/module/module_page.dart';
import 'package:vernon_edu/widgets/appbar_custom.dart';
import 'package:vernon_edu/widgets/detail_class/session_card.dart';
import 'package:vernon_edu/widgets/facilitator/facilitator_card.dart';
import 'package:vernon_edu/widgets/home/menu_class_card.dart';

// Data Dummy Pengajar Tambahan
final List<Map<String, String>> facilitators = [
  {'name': 'Nama Fasilitator 1', 'role': 'Sesi 1'},
  {'name': 'Nama Fasilitator 2', 'role': 'Sesi 6'},
];

class DetailClassPage extends StatefulWidget {
  final String username;
  final String role;
  const DetailClassPage({
    super.key,
    required this.username,
    required this.role,
  });

  @override
  State<DetailClassPage> createState() => _DetailClassPageState();
}

class _DetailClassPageState extends State<DetailClassPage> {
  // Variabel State untuk mengingat status buka/tutup
  bool isInstructorsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarCustom(title: 'Detail Kelas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Publik Speaking',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'Regular A',
                    style: GoogleFonts.poppins(
                      color: CustomColor.textPrimary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pengajar',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isInstructorsExpanded = !isInstructorsExpanded;
                          });
                        },
                        // Ikon berubah arah kalau diklik
                        child: Icon(
                          isInstructorsExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 28,
                          color: CustomColor.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //Daftar Pengajar
                  Column(
                    children: [
                      //Pengajar Utama (Manual/Statis)
                      _instructorItem(
                        "Tanti Nur Dwiyanti",
                        "Mentor - Communication",
                      ),

                      const SizedBox(height: 16),
                      if (isInstructorsExpanded) ...[
                        // .map utk Looping Fasilitator (Dinamis dari Data Dummy)
                        ...facilitators.map((data) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: _instructorItem(
                              data['name']!,
                              data['role']!,
                            ),
                          );
                        }).toList(),
                        // Tombol Tambah Kuning
                        Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            mini: true, // Ukuran kecil
                            backgroundColor:
                                CustomColor.warning, // Warna kuning
                            elevation: 0,
                            onPressed: () {
                              showAddFacilitatorSheet(context);
                            },
                            child: const Icon(
                              Icons.add,
                              color: CustomColor.textOnPrimary,
                            ),
                          ),
                        ),
                      ],

                      
                      
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  //memanggil menu_class_card
                  MenuClassCard(
                    items: [
                      MenuItemData(
                        label: "Presensi",
                        icon: "assets/icons/attendance.svg",
                        page: AttendancePage(),
                      ),
                      MenuItemData(
                        label: "Modul",
                        icon: "assets/icons/book.svg",
                        page: ModulePage(),
                      ),
                      MenuItemData(
                        label: "Assessment",
                        icon: "assets/icons/star.svg",
                        page: AssesmentPage(),
                      ),
                      MenuItemData(
                        label: "RAB",
                        icon: "assets/icons/book.svg",
                        page: Container(),
                      ),
                    ],

                    spacing: 30,
                  ),

                  const SessionCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _instructorItem(String name, String role) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Foto Profil Bulat
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200], // Placeholder abu-abu
        ),
      ),
      const SizedBox(width: 12),

      // Teks Nama & Role
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: TextStyle(fontSize: 14, color: CustomColor.textSecondary),
          ),
        ],
      ),
    ],
  );
}
