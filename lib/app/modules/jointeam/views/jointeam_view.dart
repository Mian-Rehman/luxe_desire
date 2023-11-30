import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';

import '../../../widgets/container_widget.dart';
import '../controllers/jointeam_controller.dart';

class JointeamView extends StatelessWidget {
  const JointeamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    final controller = Get.put(JoinTeamController());
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
          centerTitle: true,
          elevation: 4,
        ),
        body: StreamBuilder(
            stream: firestore.collection('team').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.docs.isEmpty
                    ? teamMethod(isDark, controller, snapshot, snapshot)
                    : ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_, index) {
                          var data = snapshot.data!.docs[index];
                          return snapshot.data!.docs.isEmpty
                              ? teamMethod(isDark, controller, data, snapshot)
                              : data['status'] == 'Pending'
                                  ? Center(
                                      child: Text(
                                        'Your request submitted to admin\nPlease wait admin response',
                                        style: GoogleFonts.readexPro(
                                          color: DarkThemeColor.primaryText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    )
                                  : teamMethod(
                                      isDark, controller, data, snapshot);
                        });
              } else {
                return loader;
              }
            }));
  }

  SingleChildScrollView teamMethod(
      bool isDark, JoinTeamController controller, var data, var status) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(seconds: 1),
              childAnimationBuilder: (widget) => FlipAnimation(
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
              children: [
                Text(
                  'Hurry Up!',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                  ),
                ),
                Text(
                  'Join the Team',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primary,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      'First Name',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  labelText: '',
                  hintText: 'First Name',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: DarkThemeColor.alternate,
                  inputController: controller.nameController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Sur Name',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  labelText: '',
                  hintText: 'SurName',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: DarkThemeColor.alternate,
                  inputController: controller.surNameController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  labelText: '',
                  hintText: 'Email Address',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  type: TextInputType.emailAddress,
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: DarkThemeColor.alternate,
                  inputController: controller.emailController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  type: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  labelText: '',
                  hintText: 'Phone Number',
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: DarkThemeColor.alternate,
                  inputController: controller.phoneController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Date of Birth',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  hintText: 'DOB',
                  labelText: '',
                  textInputAction: TextInputAction.next,
                  type: TextInputType.number,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: LightThemeColor.alternate,
                  inputController: controller.dobController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Role',
                    style: GoogleFonts.readexPro(
                      color: isDark
                          ? LightThemeColor.primaryBackground
                          : DarkThemeColor.secondaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 0; i < controller.attendance.length; i++)
                        Obx(() => Row(
                              children: [
                                Radio(
                                  activeColor:
                                      isDark ? Colors.white : Colors.black,
                                  value: controller.attendance[i].toString(),
                                  groupValue: controller.selectedValue.value,
                                  onChanged: (value) =>
                                      controller.checkBox(check: value),
                                ),
                                Text(
                                  controller.attendance[i],
                                  style: GoogleFonts.readexPro(
                                    color: isDark
                                        ? LightThemeColor.primaryBackground
                                        : DarkThemeColor.secondaryText,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'About Me',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  hintText: 'About Me...',
                  labelText: '',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: LightThemeColor.alternate,
                  maxLines: 5,
                  inputController: controller.descController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Facebook',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  hintText: 'Facebook',
                  labelText: '',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: LightThemeColor.alternate,
                  inputController: controller.fbController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Instagram',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  hintText: 'Instagram',
                  labelText: '',
                  textInputAction: TextInputAction.next,
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: LightThemeColor.alternate,
                  inputController: controller.instaController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Sound Cloud',
                      style: GoogleFonts.readexPro(
                        color: isDark
                            ? LightThemeColor.primaryBackground
                            : DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 10,
                    )
                  ],
                ),
                InputField(
                  hintText: 'Sound Cloud',
                  labelText: '',
                  validatior: (value) {
                    if (value.toString().isEmpty) {
                      return '';
                    }
                  },
                  bgColor: isDark
                      ? LightThemeColor.primaryBackground
                      : DarkThemeColor.primaryText,
                  bdColor: LightThemeColor.alternate,
                  inputController: controller.soundBandController,
                  isContentPadding: false,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Obx(
                  () => status.data!.docs.isEmpty
                      ? controller.loading.value == false
                          ? SubmitButton(
                              title: 'Join',
                              onTap: () {
                                if (controller.nameController.text.isNotEmpty &&
                                    controller
                                        .surNameController.text.isNotEmpty &&
                                    controller
                                        .emailController.text.isNotEmpty &&
                                    controller
                                        .phoneController.text.isNotEmpty &&
                                    controller.dobController.text.isNotEmpty &&
                                    controller.descController.text.isNotEmpty &&
                                    controller.fbController.text.isNotEmpty &&
                                    controller
                                        .instaController.text.isNotEmpty &&
                                    controller
                                        .soundBandController.text.isNotEmpty) {
                                  controller.loader();
                                  controller.uploadDataToDB();
                                } else {
                                  toast(
                                      message:
                                          'Please fill all required fields',
                                      color: DarkThemeColor.primary,
                                      title: 'Alert!');
                                }
                              },
                              width: double.infinity.w,
                              height: 50.h,
                              textColor: DarkThemeColor.primaryText,
                              bgColor: DarkThemeColor.primary,
                            )
                          : ContainerWidget(
                              bgColor: DarkThemeColor.primary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Loading...',
                                      style: GoogleFonts.readexPro(
                                        color: !isDark
                                            ? LightThemeColor.primaryText
                                            : DarkThemeColor.primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                      : controller.loading.value == false
                          ? SubmitButton(
                              title: 'Edit',
                              onTap: () {
                                controller.loader();
                                controller.updateDataToDB();
                              },
                              width: double.infinity.w,
                              height: 50.h,
                              textColor: DarkThemeColor.primaryText,
                              bgColor: DarkThemeColor.primary,
                            )
                          : ContainerWidget(
                              bgColor: DarkThemeColor.primary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Loading...',
                                      style: GoogleFonts.readexPro(
                                        color: !isDark
                                            ? LightThemeColor.primaryText
                                            : DarkThemeColor.primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                )
              ]),
        ));
  }
}
