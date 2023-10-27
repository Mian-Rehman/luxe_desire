import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/theme_controller.dart';

class BrowseWidget extends StatelessWidget {
  const BrowseWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.press});
  final String image, name;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: press,
      child: Container(
        width: size.width * .3.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: isDark ? Colors.black26 : DarkThemeColor.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x520E151B),
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: Column(
            children: [
              Container(
                height: 64.h,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26 : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(image)),
                ),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Readex Pro',
                      color: isDark
                          ? DarkThemeColor.primary
                          : DarkThemeColor.alternate,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
