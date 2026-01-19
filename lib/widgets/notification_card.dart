import 'package:flutter/material.dart';
import 'package:vernon_edu/widgets/shared/constants/colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Margin bawah jarak antar kartu
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16.0),
      // width: 594,
      // height: 166,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.alphaBlend(CustomColor.primary.withOpacity(0.15), CustomColor.textOnPrimary),
        boxShadow: [BoxShadow(
          color: CustomColor.textHint, spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 3)
        )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //judul
          Text(
            title,
            style: TextStyle(fontSize: 20, color: CustomColor.textPrimary,),
          ),
          // garis pembatas
          const Divider(
            color: CustomColor.textHint,
            thickness: 1, //ketebalan
            height: 30,
          ),
          //konten bawah (icon + deskripsi)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //icon bulat
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColor.textOnPrimary,
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: CustomColor.textHint,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16.0),

              // text deskripsi
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    color: CustomColor.textPrimary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
