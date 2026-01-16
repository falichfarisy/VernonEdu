import 'package:flutter/material.dart';
import 'package:vernon_edu/pages/home/beranda_page.dart';
import 'package:vernon_edu/pages/notification/notification_page.dart';
import 'package:vernon_edu/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: NavigationBarWidget(
        currentPageIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        
      }, 
      backgroundColor: Colors.green,
      label: Text('Chat Admin'),
      icon: Icon(Icons.chat),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildBody() {
    switch (currentPageIndex) {
      case 0:
        return BerandaPage();
      case 1:
        // return BerandaPage();
      case 2:
        return NotificationPage();
      default:
        return BerandaPage();
    }
  }
}
