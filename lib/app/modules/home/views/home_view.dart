import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/home/views/components/menu_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/popular_area.dart';

import '../../../constants/app_color.dart';
import '../../../constants/firebase.dart';
import '../../../constants/theme_controller.dart';
import '../controllers/home_controller.dart';
import 'components/video_area.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  var controller = Get.put(HomeController());
  updateUser() async {
    Future.delayed(const Duration(seconds: 5), () async {
      if (controller.usersList.contains(currentUser!.uid)) {
      } else {
        await firestore
            .collection('users')
            .doc(currentUser!.uid)
            .update({'id': currentUser!.uid});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    firestore.collection('users').doc(auth.currentUser!.email).update({
      'uid': auth.currentUser!.uid,
    });
    log(auth.currentUser!.email.toString());
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      height: size.height.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  DarkThemeColor.secondaryBackground,
                  DarkThemeColor.error,
                  DarkThemeColor.tertiary,
                ]
              : [
                  LightThemeColor.primary,
                  LightThemeColor.error,
                  LightThemeColor.tertiary,
                ],
          stops: const [0, 0.5, 1],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    DarkThemeColor.primaryBackground,
                    DarkThemeColor.primary,
                  ]
                : [
                    LightThemeColor.primary,
                    LightThemeColor.secondaryBackground,
                  ],
            stops: const [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimationLimiter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(seconds: 1),
                      childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: -50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          width: MediaQuery.sizeOf(context).width,
                          child: Text(
                            "Welcome \n to Luxe Desires ",
                            style: TextStyle(
                              fontSize: 28,
                              color: isDark
                                  ? DarkThemeColor.primaryText
                                  : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ),
              ),
              Column(
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(seconds: 1),
                    childAnimationBuilder: (widget) => FlipAnimation(
                          child: ScaleAnimation(
                            child: widget,
                          ),
                        ),
                    children: [
                      const MenuArea(),
                      const VideoArea(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
