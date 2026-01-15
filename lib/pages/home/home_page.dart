import 'package:flutter/material.dart';
import 'package:vernon_edu/constants/colors.dart';
import 'package:vernon_edu/widgets/home/menu_class_card.dart';
import 'package:vernon_edu/widgets/home/profile_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: CustomColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ProfileCard(),
              ),
              Positioned(
                bottom: -60, // bikin card keluar dari header
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 12,
                      top: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuClassCard(
                          items: [
                            MenuItemData(
                              icon: 'assets/icons/folder.svg',
                              label: 'Kelas',
                            ),
                            MenuItemData(
                              icon: 'assets/icons/education.svg',
                              label: 'Fasilitator',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}