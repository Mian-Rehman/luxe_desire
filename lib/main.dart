import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/payment_integration/keys.dart';
import 'app/routes/app_pages.dart';

final ThemeController controller = Get.put(ThemeController());
void main() async {
  Stripe.publishableKey = publicKey;
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: DarkThemeColor.primary));
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Obx(
        () => GetMaterialApp(
          title: "Luxe Desires",
          theme: controller.theme.value,
          debugShowCheckedModeBanner: false,
          initialRoute:
              currentUser != null ? AppPages.BottomNAV : AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    ),
  );
}
