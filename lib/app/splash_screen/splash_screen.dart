import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:luxe_desires/app/modules/onboarding/views/onboarding_view.dart';
import '../constants/app_color.dart';
import '../constants/firebase.dart';
import '../constants/theme_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> animation =
      Tween(begin: 2.0, end: 0.0).animate(controller);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      if (auth.currentUser == null) {
        Get.offAll(() => const OnboardingView(),
            transition: Transition.circularReveal);
      } else {
        Get.offAll(() => const BottomNavBar());
      }
    });
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      backgroundColor: isDark
          ? DarkThemeColor.secondaryBackground
          : LightThemeColor.secondaryBackground,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: !isDark ? LightThemeColor.accent4 : DarkThemeColor.accent4,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.w, 15.h, 15.w, 15.h),
              child: Image.asset(
                'assets/imgs/Logo.png',
                fit: BoxFit.cover,
              ),
            ),
          )
              .animate()
              .fadeIn(duration: const Duration(seconds: 2))
              .then(delay: 500.ms) // baseline=800ms
              .slide()
              .then(delay: 1000.ms)
              .fadeOut(duration: const Duration(seconds: 4)),
        ),
      ),
    );
  }
}
