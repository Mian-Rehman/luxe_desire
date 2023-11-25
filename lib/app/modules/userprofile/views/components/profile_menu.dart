import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/modules/booking_history_screen/booking_history_screen.dart';
import 'package:luxe_desires/app/modules/userprofile/views/widgets/profile_menu_tile.dart';
import 'package:luxe_desires/app/pages/reward_screen.dart';
import 'package:luxe_desires/app/pages/sub_screen.dart';
import 'package:luxe_desires/app/routes/app_pages.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.w, 12.h, 0, 0.h),
          child: Text(
            'Features',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        ProfileMenuTile(
          title: 'Rewards',
          onTap: () {
            Get.to(const RewardScreen());
          },
        ),
        ProfileMenuTile(
          title: 'Tickets',
          onTap: () {
            Get.to(const BookingHistoryScreen());
          },
        ),
        ProfileMenuTile(
          title: 'Subscription',
          onTap: () {
            Get.to(const SubsScreen());
          },
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.w, 12.h, 0, 0.h),
          child: Text(
            'Account Settings',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        ProfileMenuTile(
          title: 'User',
          onTap: () {
            Get.toNamed(Routes.USERS);
          },
        ),
        ProfileMenuTile(
          title: 'Join our Team',
          onTap: () {
            Get.toNamed(Routes.JOINTEAM);
          },
        ),
        ProfileMenuTile(
          title: 'Music List',
          onTap: () {
            Get.toNamed(Routes.MUSICLIST, arguments: true);
          },
        ),
        ProfileMenuTile(
          title: 'Shop',
          onTap: () {
            Get.toNamed(Routes.SHOP);
          },
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.w, 12.h, 0, 0.h),
          child: Text(
            'Account Settings',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        ProfileMenuTile(
          title: 'Forget Password',
          onTap: () {
            Get.toNamed(Routes.FORGOTPASSWORD);
          },
        ),
        ProfileMenuTile(
          title: 'Edit Profile',
          onTap: () {
            Get.toNamed(Routes.EDITPROFILE);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: SubmitButton(
            title: 'logout',
            onTap: () {
              Get.offAllNamed(Routes.AUTHPAGE);
            },
            width: 90.w,
            height: 50.w,
            bgColor: !isDark
                ? LightThemeColor.secondaryBackground
                : DarkThemeColor.secondaryBackground,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
