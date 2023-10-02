import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/userprofile/views/components/profile_menu.dart';
import 'package:luxe_desires/app/modules/userprofile/views/components/theme_row.dart';
import 'package:luxe_desires/app/modules/userprofile/views/widgets/profile_menu_tile.dart';
import '../../../constants/theme_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/userprofile_controller.dart';

class UserprofileView extends StatelessWidget {
  const UserprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var controller = Get.put(UserprofileController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DarkThemeColor.primary,
          automaticallyImplyLeading: true,
          title: Text(
            'App Settings',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Readex Pro',
                  fontSize: 19.sp,
                ),
          ),
          foregroundColor:
              !isDark ? LightThemeColor.primaryText : DarkThemeColor.alternate,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Change Theme',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const ThemeModeRow(),
              SizedBox(
                height: size.height * .01.h,
              ),
              Text(
                'Notifications',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: size.height * .01.h,
              ),
              Obx(() => notifyMethod(
                  context: context,
                  text: 'Email Notification',
                  value: controller.emailCheck.value,
                  onChange: (value) => controller.checkEmail())),
              Obx(() => notifyMethod(
                  context: context,
                  text: 'Phone Notification',
                  value: controller.phoneCheck.value,
                  onChange: (value) => controller.checkPhone())),
              Obx(() => notifyMethod(
                  context: context,
                  text: 'Push Notification',
                  value: controller.pushCheck.value,
                  onChange: (value) => controller.checkPush())),
              SizedBox(
                height: size.height * .01.h,
              ),
              Text(
                'Account Settings',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ProfileMenuTile(
                  title: 'Reset Password',
                  onTap: () => Get.toNamed(Routes.FORGOTPASSWORD)),
              // const ProfileMenu()
            ],
          ),
        ));
  }

  SwitchListTile notifyMethod(
      {required BuildContext context,
      required String text,
      required bool value,
      required Function(dynamic) onChange}) {
    return SwitchListTile.adaptive(
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        value: value,
        onChanged: onChange);
  }
}
