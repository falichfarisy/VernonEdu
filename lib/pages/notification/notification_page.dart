import 'package:flutter/material.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/notification_card.dart';
import 'package:vernon_edu/widgets/profile_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyNotifications = [
      {
        "title": "Informasi Libur Kelas",
        "desc":
            "Sehubung dengan perayaan Hari Natal dan Tahun Baru, seluruh kelas diliburkan pada tanggal 25 Desember 2025 dan mulai berjalan kembali pada tanggal 6 Januari 2025.",
      },
      {
        "title": "Informasi Pembaruan Sistem",
        "desc":
            "Kami merilis pembaruan yang meningkatkan stabilitas dan performa aplikasi. Disarankan untuk memperbarui ke versi terbaru agar pengalamanmu semakin optimal.",
      },
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileCard(
            username: "Tanti Nur Dwiyanti",
            role: "Mentor - Communication",
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Notifikasi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyNotifications.length,
              itemBuilder: (context, index) {
                final data = dummyNotifications[index];
                return NotificationCard(
                  title: data['title']!,
                  description: data['desc']!,
                );
              },
            ),
          ),
        ],
      ),
    );
 //pengganti for loop
  }
}
