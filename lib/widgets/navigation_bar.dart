import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';

class NavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = CustomColor.primary;

    return Container(
      height: 70,
      decoration: BoxDecoration(color: CustomColor.backgroundInput),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            iconActive: 'home-active.svg',
            iconInactive: 'home-inactive.svg',
            label: 'Beranda',
            index: 0,
            activeColor: activeColor,
          ),
          _navItem(
            iconActive: 'schedule-active.svg',
            iconInactive: 'schedule-inactive.svg',
            label: 'Jadwal',
            index: 1,
            activeColor: activeColor,
          ),
          _navItem(
            iconActive: 'notification-active.svg',
            iconInactive: 'notification-inactive.svg',
            label: 'Notifikasi',
            index: 2,
            activeColor: activeColor,
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required String iconActive,
    required String iconInactive,
    required String label,
    required int index,
    required Color activeColor,
  }) {
    final bool isActive = currentIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SizedBox(
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/${isActive ? iconActive : iconInactive}',
                height: 32,
                width: 32,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: isActive ? activeColor : CustomColor.textHint,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 3,
                width: isActive ? 70 : 0,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
