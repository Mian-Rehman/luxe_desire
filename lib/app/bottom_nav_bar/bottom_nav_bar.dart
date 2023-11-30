import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/modules/booking_history_screen/booking_history_screen.dart';
import 'package:luxe_desires/app/modules/home/views/home_view.dart';
import 'package:luxe_desires/app/modules/jointeam/views/jointeam_view.dart';
import 'package:luxe_desires/app/modules/setting_screen/settings_sceeen.dart';
import 'package:luxe_desires/app/pages/reward_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation? rotationAnimation;
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController!);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController!);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController!);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));

    animationController!.addListener(() {
      setState(() {});
    });
  }

  int currentIndex = 0;
  List pages = [
    HomeView(),
    const BookingHistoryScreen(),
    const RewardScreen(),
    const JointeamView(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: DarkThemeColor.primary));
    return Scaffold(
        // backgroundColor: DarkThemeColor.primaryBackground,
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
