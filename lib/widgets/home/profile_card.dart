import 'package:flutter/material.dart';
import 'package:vernon_edu/constants/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/sample_profile.jpg'),
              ),
              SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi',
                    style: TextStyle(
                      color: CustomColor.textOnPrimary,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tanti Nur Dwiyanti',
                    style: TextStyle(
                      color: CustomColor.textOnPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mentor - Communication',
                    style: TextStyle(
                      color: CustomColor.textOnPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
