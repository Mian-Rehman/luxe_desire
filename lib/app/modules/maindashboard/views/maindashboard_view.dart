import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';

import '../controllers/maindashboard_controller.dart';

class MaindashboardView extends GetView<MaindashboardController> {
  const MaindashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.tabs[controller.currentTab.value]),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});
  final barController = Get.put(MaindashboardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: DarkThemeColor.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(14.r),
        ),
        // boxShadow: [
        //   // BoxShadow(
        //   //   offset: const Offset(0, -1),
        //   //   blurRadius: 20.h,
        //   //   color: const Color.fromRGBO(180, 180, 180, 0.15),
        //   // )
        // ],
      ),
      height: 50.h,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(
              icon: Icons.home_outlined,
              isActive: barController.currentTab.value == 0,
              onTap: () {
                barController.currentTab.value = 0;
              },
            ),
            NavItem(
              icon: Icons.graphic_eq,
              isActive: barController.currentTab.value == 1,
              onTap: () {
                barController.currentTab.value = 1;
              },
            ),
            NavItem(
              icon: Icons.music_note,
              isActive: barController.currentTab.value == 2,
              onTap: () {
                barController.currentTab.value = 2;
              },
            ),
            NavItem(
              icon: Icons.settings,
              isActive: barController.currentTab.value == 3,
              onTap: () {
                barController.currentTab.value = 3;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        alignment: Alignment.bottomCenter,
        // color: Colors.white,
        child: Column(
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isActive
                  ? DarkThemeColor.alternate
                  : DarkThemeColor.primaryBackground,
            ),
          ],
        ),
      ),
    );
  }
}
