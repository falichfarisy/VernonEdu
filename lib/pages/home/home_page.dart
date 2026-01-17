import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/pages/home/beranda_page.dart';
import 'package:vernon_edu/pages/notification/notification_page.dart';
import 'package:vernon_edu/pages/schedule/schedule_page.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const BerandaPage(),
    const SchedulePage(),
    const NotificationPage(),
  ];

  void onNavItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBarWidget(
        currentIndex: pageIndex,
        onTap: onNavItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF8FBE55),
        label: Text(
          'Chat Admin',
          style: GoogleFonts.poppins(
            color: CustomColor.textOnPrimary,
            fontWeight: FontWeight.w600
            ),
        ),
        icon: SvgPicture.asset(
          'assets/icons/whatsapp-logo.svg',
          height: 30,
        ),
      ),
    );
  }
}
