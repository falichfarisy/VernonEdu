import 'package:flutter/material.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/appbar_custom.dart';
import 'package:vernon_edu/widgets/kelas/aktif_fragment.dart';
import 'package:vernon_edu/widgets/kelas/mendatang_fragment.dart';
import 'package:vernon_edu/widgets/kelas/selesai_fragment.dart';

class ActiveClassPage extends StatefulWidget {
  const ActiveClassPage({super.key});

  @override
  State<ActiveClassPage> createState() => _ActiveClassPageState();
}

class _ActiveClassPageState extends State<ActiveClassPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundInput,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarCustom(title: 'Kelas'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          statusTab(),
          const SizedBox(height: 16),
          Expanded(child: buildFragment()),
        ],
      ),
    );
  }

  Widget statusTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(child: tabItem('Aktif', 0)),
            Expanded(child: tabItem('Mendatang', 1)),
            Expanded(child: tabItem('Selesai', 2)),
          ],
        ),
      ),
    );
  }

  Widget tabItem(String text, int index) {
    final bool isActive = selectedTab == index;

    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? CustomColor.secondary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? CustomColor.textOnPrimary : CustomColor.textHint,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget buildFragment() {
    switch (selectedTab) {
      case 0:
        return const AktifFragment();
      case 1:
        return const MendatangFragment();
      case 2:
        return const SelesaiFragment();
      default:
        return const AktifFragment();
    }
  }
}
