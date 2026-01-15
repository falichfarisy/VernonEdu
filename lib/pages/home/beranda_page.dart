import 'package:flutter/material.dart';
import 'package:vernon_edu/models/information_class_model.dart';
import 'package:vernon_edu/widgets/home/class_information_card.dart';
import 'package:vernon_edu/widgets/home/menu_class_card.dart';
import 'package:vernon_edu/widgets/home/profile_card.dart';
import 'package:vernon_edu/constants/colors.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = InformationClassModel.getAllInformationClass();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              bottom: -80,
              left: 20,
              right: 20,
              child: MenuClassCard(
                items: [
                  MenuItemData(icon: 'assets/icons/folder.svg', label: 'Kelas'),
                  MenuItemData(
                    icon: 'assets/icons/education.svg',
                    label: 'Fasilitator',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 100),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: classes.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return ClassInformationCard(data: classes[index]);
            },
          ),
        ),
      ],
    );
  }
}
