import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imk_app/theme/apps_color.dart';
import 'package:imk_app/views/Home.dart';
import 'package:imk_app/views/chatbox.dart';
import 'package:imk_app/views/mycourse.dart';
import 'package:imk_app/views/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const ChatBox(),
    const MyCourse(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.grey[800],
            activeColor: Colors.white,
            tabBackgroundColor: AppColors.primary,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: FontAwesomeIcons.comment,
                text: 'Chat',
              ),
              GButton(
                icon: FontAwesomeIcons.book,
                text: 'Courses',
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
