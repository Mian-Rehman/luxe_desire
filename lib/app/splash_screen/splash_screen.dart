import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true); // AnimationContr011er
  late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutBack,
      reverseCurve: Curves.easeInBack);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 500.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          DarkThemeColor.primary,
                          DarkThemeColor.error,
                          DarkThemeColor.tertiary,
                        ]
                      : [
                          LightThemeColor.primary,
                          LightThemeColor.error,
                          LightThemeColor.tertiary,
                        ],
                  stops: const [0, 0.5, 1],
                  begin: const AlignmentDirectional(-1, -1),
                  end: const AlignmentDirectional(1, 1),
                ),
              ),
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [
                            DarkThemeColor.primary,
                            DarkThemeColor.secondaryBackground,
                          ]
                        : [
                            LightThemeColor.primary,
                            LightThemeColor.secondaryBackground,
                          ],
                    stops: const [0, 1],
                    begin: const AlignmentDirectional(0, -1),
                    end: const AlignmentDirectional(0, 1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                        opacity: animation,
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: !isDark
                                ? LightThemeColor.accent4
                                : DarkThemeColor.accent4,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.w, 15.h, 15.w, 15.h),
                            child: Image.asset(
                              'assets/imgs/Logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
