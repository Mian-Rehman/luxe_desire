import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // signin controllers
  final passwordLoginController = TextEditingController();
  final passwordLoginVisibility = false.obs;
  // signup controllers
  final nameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibility = false.obs;
  final passwordConfirmController = TextEditingController();
  final otpController = TextEditingController();
  final passwordConfirmVisibility = false.obs;
  var loading = false.obs;
  var loginLoad = false.obs;

  loader() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 5));
    loading.value = false;
  }

  loginLoader() async {
    loginLoad.value = true;
    await Future.delayed(const Duration(seconds: 5));
    loginLoad.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    passwordLoginController.dispose();
    nameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }
}
