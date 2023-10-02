import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/modules/authpage/controllers/authpage_controller.dart';
import 'package:luxe_desires/app/services/services.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import '../../../../constants/theme_controller.dart';

class SignUpTab extends GetView<AuthController> {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          // color: Color(0xFF14181B),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/imgs/authBg.png',
            ).image,
          ),
        ),
        child: Container(
          width: 100.h,
          height: 100.w,
          decoration: const BoxDecoration(
            color: Color(0x990F1113),
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
                        'assets/imgs/Logo.png',
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(44.w, 0, 44.w, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        InputField(
                          labelText: 'Full Name',
                          textInputAction: TextInputAction.next,
                          validatior: (value) {
                            if (value.toString().isEmpty) {
                              return '';
                            }
                          },
                          inputController: controller.nameController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        InputField(
                          labelText: 'Email Address',
                          textInputAction: TextInputAction.next,
                          validatior: (value) {
                            if (value.toString().isEmpty) {
                              return '';
                            }
                          },
                          inputController: controller.emailAddressController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        InputField(
                          labelText: 'Phone Number',
                          textInputAction: TextInputAction.next,
                          type: TextInputType.phone,
                          validatior: (value) {
                            if (value.toString().isEmpty) {
                              return '';
                            }
                          },
                          inputController: controller.phoneNumberController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(
                          () => InputField(
                            labelText: 'Password',
                            textInputAction: TextInputAction.next,
                            validatior: (value) {
                              if (value.toString().isEmpty) {
                                return '';
                              }
                            },
                            secure: controller.passwordVisibility.value,
                            suffix: controller.passwordVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixPress: () {
                              controller.passwordVisibility.value =
                                  !controller.passwordVisibility.value;
                            },
                            inputController: controller.passwordController,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Obx(
                          () => InputField(
                            labelText: 'Confirm Password',
                            validatior: (value) {
                              if (value.toString().isEmpty) {
                                return '';
                              }
                            },
                            secure: controller.passwordConfirmVisibility.value,
                            suffix: controller.passwordConfirmVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixPress: () {
                              controller.passwordConfirmVisibility.value =
                                  !controller.passwordConfirmVisibility.value;
                            },
                            inputController:
                                controller.passwordConfirmController,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Obx(() => controller.loading.value == false
                            ? SubmitButton(
                                title: 'Create Account',
                                onTap: () {
                                  controller.loader();
                                  AuthServices().signUp(
                                      email: controller
                                          .emailAddressController.text,
                                      password: controller
                                          .passwordConfirmController.text,
                                      dbName: 'users',
                                      context: context,
                                      map: {
                                        'userName':
                                            controller.nameController.text,
                                        'phoneNumber': controller
                                            .phoneNumberController.text,
                                        'email': controller
                                            .emailAddressController.text,
                                        'password': controller
                                            .passwordConfirmController.text,
                                        'userID': currentUser!.uid,
                                        'joinDate': DateTime.now()
                                      });
                                },
                                width: 230.w,
                                height: 50.h,
                                bgColor: DarkThemeColor.primary,
                                // bdColor: LightThemeColor.accent4,
                              )
                            : ContainerWidget(
                                bgColor: DarkThemeColor.primary,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                      const Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Already have a account?',
                        style: GoogleFonts.readexPro(
                          color: DarkThemeColor.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      SubmitButton(
                        title: 'Signin',
                        textColor: DarkThemeColor.primary,
                        onTap: () => Get.back(),
                        width: 73.w,
                        height: 40.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
