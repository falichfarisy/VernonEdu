import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
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
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        titleSpacing: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow-left.svg', width: 10),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail Kelas',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: CustomColor.textOnPrimary,
          ),
        ),
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
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
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
                  //memanggi menu_class_card
                  MenuClassCard(
                    items: [
                      MenuItemData(
                        label: "Presensi",
                        icon: "assets/icons/attendance.svg",
                        page: Container(),
                      ),
                      MenuItemData(
                        label: "Modul",
                        icon: "assets/icons/book.svg",
                        page: Container(),
                      ),
                      MenuItemData(
                        label: "Assessment",
                        icon: "assets/icons/star.svg",
                        page: Container(),
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
