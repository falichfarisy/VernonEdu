import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onDestinationSelected;

  const NavigationBarWidget({
    super.key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
          label: 'Messages',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
      ],
    );
  }
}