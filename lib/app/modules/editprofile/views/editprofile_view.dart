import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import '../../../widgets/container_widget.dart';
import '../controllers/editprofile_controller.dart';

class EditprofileView extends StatefulWidget {
  const EditprofileView({Key? key}) : super(key: key);

  @override
  State<EditprofileView> createState() => _EditprofileViewState();
}

class _EditprofileViewState extends State<EditprofileView> {
  var controller = Get.put(EditprofileController());

  File? image;

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
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Profile',
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
      body: StreamBuilder(
          stream: firestore
              .collection('users')
              .where('email', isEqualTo: auth.currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    var data = snapshot.data!.docs[index];
                    controller.emailAddressController.text = data['email'];
                    controller.nameController.text = data['userName'];
                    controller.phoneNumberController.text = data['phoneNumber'];
                    return Column(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: image == null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                    data['profilePic'],
                                  ))
                                : CircleAvatar(
                                    backgroundImage: FileImage(
                                      image!,
                                    ),
                                  )),
                        Text(
                          data['userName'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        TextButton(
                          child: Text(
                            "Change profile picture",
                            style: TextStyle(
                                color: isDark
                                    ? DarkThemeColor.primaryText
                                    : DarkThemeColor.secondaryText),
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
                        SizedBox(
                          height: size.height * .02.h,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.all(8.0.h),
                          decoration: BoxDecoration(
                            color: !isDark
                                ? LightThemeColor.secondaryBackground
                                : DarkThemeColor.secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x430F1113),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ContainerWidget(
                                  width: double.infinity,
                                  height: 50,
                                  bgColor: DarkThemeColor.primary,
                                  child: Text(data['email'])),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              ContainerWidget(
                                  width: double.infinity,
                                  height: 50,
                                  bgColor: DarkThemeColor.primary,
                                  child: Text(data['phoneNumber'])),
                              SizedBox(
                                height: size.height * .02.h,
                              ),
                              SubmitButton(
                                title: 'Update Profile',
                                onTap: () {
                                  Get.defaultDialog(
                                      title: 'Profile Page',
                                      backgroundColor: DarkThemeColor.primary,
                                      content: profileFormMethod(data, isDark));
                                },
                                width: double.infinity.w,
                                height: 50.h,
                                textColor: DarkThemeColor.primaryText,
                                bgColor: DarkThemeColor.primary,
                              ),
                              SizedBox(
                                height: 30.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
  }

  Column profileFormMethod(
      QueryDocumentSnapshot<Map<String, dynamic>> data, bool isDark) {
    return Column(
      children: [
        InputField(
          labelText: 'UserName',
          validatior: (value) {
            if (value.toString().isEmpty) {
              return '';
            }
          },
          bgColor: Colors.white,
          textInputAction: TextInputAction.next,
          inputController: controller.nameController,
          isContentPadding: false,
        ),
        SizedBox(
          height: 12.h,
        ),
        InputField(
          labelText: 'Email',
          validatior: (value) {
            if (value.toString().isEmpty) {
              return '';
            }
          },
          bgColor: Colors.white,
          textInputAction: TextInputAction.next,
          inputController: controller.emailAddressController,
          isContentPadding: false,
        ),
        SizedBox(
          height: 12.h,
        ),
        InputField(
          labelText: 'Number',
          validatior: (value) {
            if (value.toString().isEmpty) {
              return '';
            }
          },
          bgColor: Colors.white,
          textInputAction: TextInputAction.done,
          inputController: controller.phoneNumberController,
          isContentPadding: false,
        ),
        SizedBox(
          height: size.height * .05.h,
        ),
        Obx(() => controller.loading.value == false
            ? SubmitButton(
                title: 'Update',
                onTap: () {
                  controller.loader();
                  controller.updateProfile(
                      id: data.id, image: image!, oldImage: data['profilePic']);
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
                        'Profile Updating...',
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
    );
  }
}
