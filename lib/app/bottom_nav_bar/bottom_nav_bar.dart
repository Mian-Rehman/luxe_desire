import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/modules/home/views/home_view.dart';
import 'package:luxe_desires/app/modules/jointeam/views/jointeam_view.dart';
import 'package:luxe_desires/app/modules/setting_screen/settings_sceeen.dart';
import 'package:luxe_desires/app/pages/reward_screen.dart';
import 'package:luxe_desires/app/pages/ticket_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List pages = [
    HomeView(),
    const TicketScreen(),
    const RewardScreen(),
    const JointeamView(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: DarkThemeColor.primary));
    return Scaffold(
        backgroundColor: DarkThemeColor.primaryBackground,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedFontSize: 12,
          selectedItemColor: DarkThemeColor.primary,
          unselectedItemColor: DarkThemeColor.primaryText,
          backgroundColor: DarkThemeColor.primaryBackground,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: DarkThemeColor.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.airplane_ticket),
              label: 'Tickets',
              backgroundColor: DarkThemeColor.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.reviews),
              label: 'Rewards',
              backgroundColor: DarkThemeColor.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.meeting_room),
              label: 'Join Team',
              backgroundColor: DarkThemeColor.primaryBackground,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: DarkThemeColor.primaryBackground,
            ),
          ],
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: pages[currentIndex]);
  }
}
