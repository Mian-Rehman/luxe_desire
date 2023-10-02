import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            controller.usersList.contains(currentUser!.uid)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You already joined the team',
                        style: GoogleFonts.readexPro(
                          color: DarkThemeColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  )
                : Text(
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'First Name',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'SurName',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'Email Address',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              type: TextInputType.emailAddress,
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'Phone Number',
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'DOB',
              textInputAction: TextInputAction.next,
              type: TextInputType.number,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                  color: DarkThemeColor.primaryText,
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
                              activeColor: DarkThemeColor.primaryText,
                              value: controller.attendance[i].toString(),
                              groupValue: controller.selectedValue.value,
                              onChanged: (value) =>
                                  controller.checkBox(check: value),
                            ),
                            Text(
                              controller.attendance[i],
                              style: GoogleFonts.readexPro(
                                color: DarkThemeColor.primaryText,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'About Me...',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'Facebook',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'Instagram',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
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
                    color: DarkThemeColor.primaryText,
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
              labelText: 'Sound Cloud',
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
              bdColor: LightThemeColor.alternate,
              inputController: controller.soundBandController,
              isContentPadding: false,
            ),
            SizedBox(
              height: 24.h,
            ),
            Obx(() => controller.loading.value == false
                ? SubmitButton(
                    title: 'Join',
                    onTap: () {
                      controller.loader();
                      controller.updatedDataToDB();
                    },
                    width: double.infinity.w,
                    height: 50.h,
                    textColor: DarkThemeColor.primaryText,
                    bgColor: DarkThemeColor.primary,
                  )
                : ContainerWidget(
                    bgColor: DarkThemeColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    ))),
          ],
        ),
      ),
    );
  }
}
