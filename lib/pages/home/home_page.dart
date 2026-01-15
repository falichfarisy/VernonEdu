import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            children: [_buildHeader(), _buildMenuCard()],
          ),
        ],
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    height: 250,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
      color: CustomColor.primary,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: ProfileCard(),
  );
}

Widget _buildMenuCard() {
  return Positioned(
    bottom: -40, // bikin card keluar dari header
    left: 20,
    right: 20,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5),
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
      child: MenuClassCard()
    ),
  );
}
