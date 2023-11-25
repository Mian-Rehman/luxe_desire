import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/authpage/controllers/authpage_controller.dart';
import 'package:luxe_desires/app/modules/authpage/views/tabs/signup_tab.dart';
import 'package:luxe_desires/app/routes/app_pages.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constants/theme_controller.dart';
import '../../../../services/services.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(44.w, 0, 44.w, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 19.sp,
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              height: 50.h,
            ),
            InputField(
              labelText: 'Email Address',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              inputController: controller.emailController,
            ),
            SizedBox(
              height: 12.h,
            ),
            Obx(
              () => InputField(
                labelText: 'Password',
                validatior: (value) {
                  if (value.toString().isEmpty) {
                    return '';
                  }
                },
                secure: controller.passwordLoginVisibility.value,
                suffix: controller.passwordLoginVisibility.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                suffixPress: () {
                  controller.passwordLoginVisibility.value =
                      !controller.passwordLoginVisibility.value;
                },
                inputController: controller.passwordLoginController,
              ),
            ),
            Row(
              children: [
                const Text(
                  'Before continue accept',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () async =>
                      await launchUrl(Uri.parse('https://luxedesiresent.com')),
                  child: Text('Terms & Conditions',
                      softWrap: true,
                      style: TextStyle(
                        color: DarkThemeColor.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Obx(() => controller.loginLoad.value == false
                ? SubmitButton(
                    title: 'Login',
                    onTap: () {
                      if (controller.emailController.text.isNotEmpty &&
                          controller.passwordLoginController.text.isNotEmpty) {
                        controller.loginLoader();
                        AuthServices().login(
                          email: controller.emailController.text,
                          password: controller.passwordLoginController.text,
                        );
                      } else {
                        toast(
                            message: 'Please fill required fields',
                            color: DarkThemeColor.primary,
                            title: 'Alert!');
                      }
                    },
                    width: size.width.w,
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
            SizedBox(
              height: 20.h,
            ),
            SubmitButton(
              title: 'Forget Password?',
              onTap: () {
                Get.toNamed(Routes.FORGOTPASSWORD);
              },
              width: 170.w,
              height: 40.h,
              textColor: DarkThemeColor.primaryText,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Don\'t have a account?',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                SubmitButton(
                  title: 'SignUp',
                  textColor: DarkThemeColor.primary,
                  onTap: () async {
                    Get.to(() => const SignUpTab());
                  },
                  width: 73.w,
                  height: 40.h,
                ),
              ],
            ),
          ],
        ));
  }
}
