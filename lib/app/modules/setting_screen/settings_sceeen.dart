import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/modules/setting_screen/setting_model/settings_model.dart';

import '../../constants/contants.dart';
import '../../constants/theme_controller.dart';
import '../../widgets/container_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          foregroundColor: DarkThemeColor.primaryText,
          centerTitle: true,
          backgroundColor: DarkThemeColor.primary,
        ),
        body: Container(
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
            child: GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                itemCount: settingsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: size.height * .15.h,
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  var data = settingsList[index];
                  return InkWell(
                      onTap: data.press,
                      borderRadius: BorderRadius.circular(20),
                      child: ContainerWidget(
                        bgColor: DarkThemeColor.primary,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(seconds: 1),
                              childAnimationBuilder: (widget) => FlipAnimation(
                                child: ScaleAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                Icon(
                                  data.icon,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  data.text,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.readexPro(
                                    color: DarkThemeColor.primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            )),
                      ));
                }),
          ),
        ));
  }
}
