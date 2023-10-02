import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:luxe_desires/app/constants/app_color.dart';

TextStyle displayStyle = GoogleFonts.inter(
  fontSize: 57.sp,
  fontWeight: FontWeight.normal,
  color: DarkThemeColor.primaryText,
);

TextStyle labelStyle = GoogleFonts.inter(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: DarkThemeColor.secondaryText,
);

TextStyle headlineStyle = GoogleFonts.inter(
  fontSize: 24.sp,
  fontWeight: FontWeight.w500,
  color: DarkThemeColor.primaryText,
);

TextStyle bodystyle = GoogleFonts.readexPro(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  color: DarkThemeColor.primaryText,
);

TextStyle titleStyle = GoogleFonts.readexPro(
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  color: DarkThemeColor.info,
);

//------loader---

Widget loader = Center(
    child: SizedBox(
        height: 150.h,
        width: 150.w,
        child: Lottie.asset('assets/gif/123.json')));

var padding = const EdgeInsets.all(10);
var size = Get.size;

toast({required String message, required Color color, required String title}) {
  Get.snackbar(
      icon: const Icon(
        Icons.info,
      ),
      title,
      message,
      backgroundGradient: LinearGradient(
          colors: [DarkThemeColor.primary, DarkThemeColor.primary]),
      maxWidth: size.width > 500 ? Get.size.width * .5 : size.width,
      backgroundColor: color);
}

showBox({
  required String desc,
  required String confirmText,
  required Function() confirm,
}) {
  Get.defaultDialog(
    title: 'Hurrey!',
    backgroundColor: DarkThemeColor.primary,
    titleStyle: GoogleFonts.readexPro(
      color: DarkThemeColor.primaryText,
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
    buttonColor: DarkThemeColor.primaryBackground,
    textConfirm: confirmText,
    middleTextStyle: GoogleFonts.readexPro(
      color: DarkThemeColor.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
    ),
    middleText: desc,
    onConfirm: confirm,
  );
}
