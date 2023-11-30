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
        body: GridView.builder(
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
            }));
  }
}
