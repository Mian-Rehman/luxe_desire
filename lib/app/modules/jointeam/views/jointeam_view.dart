import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';

import '../controllers/jointeam_controller.dart';

class JointeamView extends GetView<JointeamController> {
  const JointeamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        title: Text(
          'Join Our team',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 19,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.w, 28.h, 24.w, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing elit laoreet auctor tristique penatibus, proin mollis porttitor habitant morbi pulvinar integer ad eget nostra gravida, fusce eleifend sapien cubilia massa ut arcu metus fermentum a. Blandit nulla eget mus torquent fringilla egestas convallis sollicitudin justo vestibulum congue nullam luctus',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 24.h,
              ),
              InputField(
                labelText: 'Name',
                validatior: (value) {
                  if (value.toString().isEmpty) {
                    return '';
                  }
                },
                bgColor: !isDark
                    ? LightThemeColor.primaryBackground
                    : DarkThemeColor.secondaryBackground,
                bdColor: DarkThemeColor.alternate,
                inputController: controller.nameController,
                isContentPadding: false,
              ),
              SizedBox(
                height: 12.h,
              ),
              InputField(
                labelText: 'Email Address',
                validatior: (value) {
                  if (value.toString().isEmpty) {
                    return '';
                  }
                },
                bgColor: !isDark
                    ? LightThemeColor.primaryBackground
                    : DarkThemeColor.secondaryBackground,
                bdColor: DarkThemeColor.alternate,
                inputController: controller.emailAddressController,
                isContentPadding: false,
              ),
              SizedBox(
                height: 12.h,
              ),
              InputField(
                labelText: 'Phone Number',
                validatior: (value) {
                  if (value.toString().isEmpty) {
                    return '';
                  }
                },
                bgColor: !isDark
                    ? LightThemeColor.primaryBackground
                    : DarkThemeColor.secondaryBackground,
                bdColor: DarkThemeColor.alternate,
                inputController: controller.phoneNumberController,
                isContentPadding: false,
              ),
              SizedBox(
                height: 12.h,
              ),
              InputField(
                labelText: 'About You...',
                validatior: (value) {
                  if (value.toString().isEmpty) {
                    return '';
                  }
                },
                bgColor: !isDark
                    ? LightThemeColor.primaryBackground
                    : DarkThemeColor.secondaryBackground,
                bdColor: LightThemeColor.alternate,
                maxLines: 5,
                inputController: controller.aboutController,
                isContentPadding: false,
              ),
              SizedBox(
                height: 24.h,
              ),
              SubmitButton(
                title: 'Send',
                onTap: () async {},
                width: 90.w,
                height: 40.h,
                textColor: DarkThemeColor.alternate,
                bgColor: DarkThemeColor.primary,
                // bdColor: LightThemeColor.accent4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
