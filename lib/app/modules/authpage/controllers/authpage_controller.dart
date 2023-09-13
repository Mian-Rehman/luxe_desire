import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthpageController extends GetxController {
  // signin controllers
  final emailAddressLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();
  final passwordLoginVisibility = false.obs;
  // signup controllers
  final nameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibility = false.obs;
  final passwordConfirmController = TextEditingController();
  final passwordConfirmVisibility = false.obs;



  @override
  void onClose() {
    super.onClose();
    emailAddressLoginController.dispose();
    passwordLoginController.dispose();
    nameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }
}
