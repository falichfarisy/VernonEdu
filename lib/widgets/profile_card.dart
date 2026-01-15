import 'package:flutter/material.dart';
import 'package:vernon_edu/constants/colors.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  final String role;

  const ProfileCard({super.key, required this.username, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity, // Lebar full
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), 
          bottomRight: Radius.circular(20),
        ),
        color: CustomColor.primary, 
      ),
      child: Column(
        children: [
          const SizedBox(height: 55), // Jarak dari atas 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container foto profile
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColor.textOnPrimary, // Background lingkaran
                ),
                // Child ini SEKARANG ada DI DALAM Container (Benar)
                child: const Icon(Icons.person_off_outlined, size: 30), 
              ),
              
              const SizedBox(width: 16.0),
              
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Menggunakan variabel username
                    Text(
                      username, 
                      style: const TextStyle( 
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textOnPrimary, 
                      ),
                      textAlign: TextAlign.left, 
                    ),
                    const SizedBox(height: 5),
                    // Menggunakan variabel role
                    Text(
                      role, 
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textOnPrimary,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}