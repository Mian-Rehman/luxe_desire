import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/authpage/controllers/authpage_controller.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import '../../../../constants/theme_controller.dart';
import '../../../../services/services.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({super.key});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  File? image;
  var controller = Get.put(AuthController());
  // Image Pick from camera
  imagePickFromCamera() async {
    final pickImageFromCamera =
        await controller.imagePicker(source: ImageSource.camera);
    setState(() {
      image = pickImageFromCamera;
    });
    Get.back();
  }

  // Image Pick from Gallery
  imagePickFromGallery() async {
    final pickImageFromGallery =
        await controller.imagePicker(source: ImageSource.gallery);
    setState(() {
      image = pickImageFromGallery;
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      body: Container(
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
          padding: EdgeInsets.only(top: size.height * .1.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: image == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage(
                          'assets/imgs/Logo.png',
                        ))
                      : CircleAvatar(
                          backgroundImage: FileImage(
                            image!,
                          ),
                        )),
              TextButton(
                child: Text(
                  "Add Picture",
                  style: TextStyle(color: DarkThemeColor.primaryText),
                ),
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Select Image from',
                      backgroundColor: DarkThemeColor.primary,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => imagePickFromCamera(),
                              child: const Text('Camera')),
                          TextButton(
                              onPressed: () => imagePickFromGallery(),
                              child: const Text('Gallery')),
                        ],
                      ));
                },
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
                        inputController: controller.passwordConfirmController,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Obx(() => controller.loading.value == false
                        ? SubmitButton(
                            title: 'Create Account',
                            onTap: () async {
                              if (controller.passwordController.text.isNotEmpty &&
                                  controller.passwordConfirmController.text
                                      .isNotEmpty &&
                                  controller.nameController.text.isNotEmpty &&
                                  controller
                                      .emailAddressController.text.isNotEmpty &&
                                  controller
                                      .phoneNumberController.text.isNotEmpty &&
                                  controller
                                      .passwordController.text.isNotEmpty &&
                                  controller.passwordConfirmController.text
                                      .isNotEmpty &&
                                  image != null) {
                                if (controller.passwordController.text ==
                                    controller.passwordConfirmController.text) {
                                  if (GetUtils.isEmail(
                                      controller.emailAddressController.text)) {
                                    final String imageUrl = await controller
                                        .firebaseStorage(image: image!);
                                    controller.loader();
                                    // ignore: use_build_context_synchronously
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
                                          'uid': '',
                                          'profilePic': imageUrl,
                                          'joinDate': DateFormat()
                                              .format(DateTime.now())
                                        });
                                    controller.sendEmail();
                                  } else {
                                    toast(
                                        message: 'Please enter a Verfied Email',
                                        color: DarkThemeColor.primary,
                                        title: 'Alert!');
                                  }
                                } else {
                                  toast(
                                      message: 'Password not match',
                                      color: DarkThemeColor.primary,
                                      title: 'Alert!');
                                }
                              } else {
                                toast(
                                    message: 'Please fill all required fields',
                                    color: DarkThemeColor.primary,
                                    title: 'Alert!');
                              }
                            },
                            width: size.width.w,
                            height: 50.h,
                            bgColor: DarkThemeColor.primary,
                          )
                        : ContainerWidget(
                            bgColor: DarkThemeColor.primary,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
    );
  }
}
