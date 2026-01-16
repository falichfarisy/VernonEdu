import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vernon_edu/constants/colors.dart';

class ModuleSessionCard extends StatefulWidget {
  final String title;
  final bool uploaded;
  final Widget? child;

  const ModuleSessionCard({
    super.key,
    required this.title,
    required this.uploaded,
    this.child,
  });

  @override
  State<ModuleSessionCard> createState() => _ModuleSessionCardState();
}

class _ModuleSessionCardState extends State<ModuleSessionCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CustomColor.textOnPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CustomColor.textPrimary.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(
          context,
        ).copyWith(dividerColor: CustomColor.textHint.withOpacity(0.6)),
        child: Column(
          children: [
            ExpansionTile(
              showTrailingIcon: false,
              tilePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              childrenPadding: const EdgeInsets.all(16),
              onExpansionChanged: (value) {
                setState(() => isExpanded = value);
              },

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.uploaded ? 'Sudah diunggah' : 'Belum diunggah',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ],
                  ),

                  CircleAvatar(
                    radius: 16,
                    backgroundColor: widget.uploaded
                        ? CustomColor.success
                        : CustomColor.warning,
                    child: SvgPicture.asset(
                      widget.uploaded
                          ? 'assets/icons/check.svg'
                          : 'assets/icons/clock.svg',
                      color: CustomColor.textOnPrimary,
                    ),
                  ),
                ],
              ),

              children: widget.child != null ? [widget.child!] : [],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AnimatedRotation(
                turns: isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: SvgPicture.asset(
                  'assets/icons/chevron-down.svg',
                  color: CustomColor.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
