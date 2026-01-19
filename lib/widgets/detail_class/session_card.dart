import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';
import 'package:vernon_edu/pages/detail_class/attendance_input.dart';
import 'package:vernon_edu/widgets/facilitator/facilitator_card.dart';

class SessionCard extends StatelessWidget {
  final String username;
  final String role;

  const SessionCard({
    super.key,
    this.username = "Nama Pengajar", // Default value
    this.role = "Role Pengajar",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CustomColor.textOnPrimary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CustomColor.textHint),
      ),

      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //scroll tangga (horizontal)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _dateBox("7", Colors.green, Colors.white),
                    const SizedBox(width: 8),
                    _dateBox(
                      "8",
                      CustomColor.warning,
                      Colors.white,
                      isActive: true,
                    ), // Aktif
                    const SizedBox(width: 8),
                    _dateBox("9", Colors.grey[200]!, Colors.black),
                    const SizedBox(width: 8),
                    _dateBox("10", Colors.grey[200]!, Colors.black),
                    const SizedBox(width: 8),
                    _dateBox("11", Colors.grey[200]!, Colors.black),
                    const SizedBox(width: 8),
                    _dateBox(
                      "12",
                      Colors.grey[200]!,
                      Colors.black,
                      hasDot: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //card materi utama
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CustomColor.textOnPrimary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: CustomColor.warning),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      "Sesi 8",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Nama Materi",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Info Waktu & Lokasi
                    _infoRow(
                      Icons.access_time,
                      "1 November 2025 | 11:00 - 13:00 WIB",
                    ),
                    const SizedBox(height: 8),
                    _infoRow(
                      Icons.location_on_outlined,
                      "VernonEdu Campus Sutoyo - Ruang A",
                    ),

                    const SizedBox(height: 20),
                    const Divider(color: CustomColor.warning), 
                    const SizedBox(height: 20),

                    // List Item (Menu Bawah)
                    _actionItem(
                      "Input Presensi",
                      Icons.person_search,
                      Icons.edit,
                      CustomColor.warning,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendanceInput(
                              username: username, // Kirim data
                              role: role, // Kirim data
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _actionItem(
                      "Nama Materi Sesi 8.pdf",
                      Icons.article,
                      Icons.download,
                      CustomColor.warning,
                    ),
                    const SizedBox(height: 12),
                    _actionItem(
                      "Assign Fasilitator",
                      Icons.school,
                      Icons.edit,
                      CustomColor.warning,
                      onTap: () {
                        showAssignFacilitatorSheet(context);
                      },
                    ),
                    const SizedBox(height: 12),
                    _actionItem(
                      "Input RAB",
                      Icons.calculate,
                      Icons.edit,
                      Colors.grey,
                      isDisabled: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //widget helper
  Widget _dateBox(
    String text,
    Color bgColor,
    Color textColor, {
    bool isActive = false,
    bool hasDot = false,
  }) {
    return Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: isActive
                ? Border.all(color: CustomColor.warning, width: 2)
                : null,
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        if (hasDot)
          Positioned(
            right: 8,
            top: 8,
            child: CircleAvatar(radius: 3, backgroundColor: Colors.red),
          ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: CustomColor.warning, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: GoogleFonts.poppins(fontSize: 14))),
      ],
    );
  }

  //helper list item (presensi, pdf, dll)
  Widget _actionItem(
    String title,
    IconData leftIcon,
    IconData rightIcon,
    Color color, {
    bool isDisabled = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: isDisabled ? null : onTap, // Kalau disabled, gak bisa diklik
      borderRadius: BorderRadius.circular(12), // Efek riak air mengikuti border
      child: Padding(
        // Tambah padding biar area klik lebih enak
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            // Icon Kiri (Bulat)
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDisabled ? Colors.grey[300] : color,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(leftIcon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),

            // Teks Tengah
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDisabled ? Colors.grey : Colors.black,
                ),
              ),
            ),

            // Icon Kanan (Edit/Download)
            if (!isDisabled)
              CircleAvatar(
                radius: 16,
                backgroundColor: color,
                child: Icon(rightIcon, color: Colors.white, size: 18),
              )
            else
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey,
                child: Icon(rightIcon, color: Colors.white, size: 18),
              ),
          ],
        ),
      ),
    );
  }
}
