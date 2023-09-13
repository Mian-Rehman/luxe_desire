import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ProfileMenuTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: !isDark
              ? LightThemeColor.secondaryBackground
              : DarkThemeColor.secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        margin: EdgeInsets.only(top: 12.h),
        padding: EdgeInsetsDirectional.all(8.h),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.w, 0, 0, 0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.9, 0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: !isDark
                      ? LightThemeColor.secondaryText
                      : DarkThemeColor.secondaryText,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
