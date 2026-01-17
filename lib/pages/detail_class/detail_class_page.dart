import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/pages/detail_class/assesment/assesment_page.dart';
import 'package:vernon_edu/pages/detail_class/attendance/attendance_page.dart';
import 'package:vernon_edu/pages/detail_class/module/module_page.dart';
import 'package:vernon_edu/widgets/appbar_custom.dart';
import 'package:vernon_edu/widgets/detail_class/session_card.dart';
import 'package:vernon_edu/widgets/home/menu_class_card.dart';

class DetailClassPage extends StatelessWidget {
  final String username;
  final String role;
  const DetailClassPage({
    super.key,
    required this.username,
    required this.role,
  });

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
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 28,
                        color: CustomColor.textPrimary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //foto profil dan teks
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .grey[200], // Warna abu-abu buat placeholder
                        ),
                        child: Icon(Icons.person, color: Colors.grey[400]),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            role,
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColor.textSecondary, // Warna abu tua
                            ),
                          ),
                        ],
                      ),
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
