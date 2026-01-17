import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';
// StatefulWidget utk interaksi (Centang & Simpan)
class AttendanceInput extends StatefulWidget {
  final String username;
  final String role;

  const AttendanceInput({
    super.key,
    required this.username,
    required this.role,
  });

  @override
  State<AttendanceInput> createState() => _AttendanceInputState();
}

class _AttendanceInputState extends State<AttendanceInput> {
  // Data Dummy Peserta
  List<Map<String, dynamic>> participants = [
    {'name': 'Ahmad Dahlan', 'isPresent': false},
    {'name': 'Siti Aisyah', 'isPresent': true},
    {'name': 'Budi Santoso', 'isPresent': true},
    {'name': 'Dewi Sartika', 'isPresent': true},
    {'name': 'Ki Hajar Dewantara', 'isPresent': true},
    {
      'name': 'R.A. Kartini',
      'isPresent': false,
    }, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        titleSpacing: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/chevron-left.svg',
            width: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Input Presensi',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: CustomColor.textOnPrimary,
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header class
            Text(
              'Public Speaking',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Reguler A',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: CustomColor.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sesi 8',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: CustomColor.textPrimary,
              ),
            ),

            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),

            // pengajar
            Text(
              'Pengajar',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.person, color: Colors.grey[400]),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username, // Pakai widget. karena di dalam State
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.role,
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 14),

            // list peserta
            Text(
              'Peserta (${participants.length})',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // ListView di dalam SingleChildScrollView
            ListView.builder(
              itemCount: participants.length,

              shrinkWrap: true, // Memadatkan list sesuai isi
              physics:
                  const NeverScrollableScrollPhysics(), // Matikan scroll list, ikut scroll induk
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      // Avatar Peserta
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[100],
                        ),
                        child: Icon(Icons.person, color: Colors.grey[400]), //blm ganti warna
                      ),
                      const SizedBox(width: 12),

                      // Nama Peserta
                      Expanded(
                        child: Text(
                          participants[index]['name'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: CustomColor.textPrimary,
                          ),
                        ),
                      ),

                      // Checkbox Custom
                      InkWell(
                        onTap: () {
                          setState(() {
                            participants[index]['isPresent'] =
                                !participants[index]['isPresent'];
                          });
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: participants[index]['isPresent']
                                ? CustomColor
                                      .success 
                                : CustomColor.textOnPrimary,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: participants[index]['isPresent']
                                  ? Colors.transparent
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: participants[index]['isPresent']
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // tombol simpan
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi simpan data
                  //print("Data tersimpan: $participants");
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.textOnPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
