import 'package:authentication/constants/colors.dart';
import 'package:authentication/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ScreenHome(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: textFormFieldColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Union.png'),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/avatar_icon.png'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
