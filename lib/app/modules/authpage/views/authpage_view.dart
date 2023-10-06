import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/authpage/views/tabs/login_tab.dart';
import '../../../constants/theme_controller.dart';
import '../controllers/authpage_controller.dart';

class AuthpageView extends GetView<AuthController> {
  const AuthpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      // backgroundColor: Color(0xFF14181B),
      body: Container(
        width: double.infinity,
        height: size.height,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 150.h, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/black_logo.png',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const LoginTab()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0),
      child: TabBar(
        isScrollable: true,
        labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 19.sp,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 19.sp,
            ),
        labelColor: DarkThemeColor.primary,
        unselectedLabelColor: DarkThemeColor.alternate,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsetsDirectional.fromSTEB(10.w, 0, 10.w, 0),
        tabs: const [
          Tab(
            text: 'Sign In',
          ),
          Tab(
            text: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
