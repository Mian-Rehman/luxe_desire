import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luxe_desires/app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:luxe_desires/app/modules/authpage/views/otp_screen.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../../../constants/app_color.dart';
import 'package:random_string/random_string.dart';
import '../../../constants/contants.dart';
import '../../../constants/firebase.dart';

class AuthController extends GetxController {
  // signin controllers
  final passwordLoginController = TextEditingController();
  final passwordLoginVisibility = false.obs;
  // signup controllers
  final nameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisibility = false.obs;
  final passwordConfirmController = TextEditingController();
  final otpController = TextEditingController();
  final passwordConfirmVisibility = false.obs;
  var loading = false.obs;
  var loginLoad = false.obs;
  String otp = randomNumeric(6);

  void sendEmail() async {
    String username = 'khalidaliflutterdev@gmail.com';
    String password = 'esjs wkbu masj pwzu';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = const Address('Luxe Desires')
      ..recipients.add(emailAddressController.text)
      ..subject = 'OTP Verification'
      ..text = """
Your OTP is in below\n$otp\nEnter your OTP to verify your email and do not share your OTP with anyone
""";
    try {
      await send(message, smtpServer);
      toast(
          message: 'Email sent successfully',
          title: 'Alert',
          color: DarkThemeColor.primary);
      Get.to(() => OTPScreen(email: emailAddressController.text, otp: otp));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    update();
  }

// verify OTP
  verifyOTP({required String otpValue}) async {
    if (otpValue == otp.toString()) {
      toast(
          message: 'Your Email is verified',
          title: 'Alert',
          color: DarkThemeColor.primary);
      Get.off(() => const BottomNavBar());
    } else {
      toast(
          message: 'Please enter a valid OTP',
          title: 'Alert',
          color: DarkThemeColor.primary);
    }
    update();
  }

// Upload Product Image on Firebase Storage
  firebaseStorage({required File image}) async {
    final Reference reference =
        storage.ref('/ProfilePicture/${DateTime.now().toString()}');
    final UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  imagePicker({required ImageSource source}) async {
    final imagePickers = await ImagePicker().pickImage(source: source);
    if (imagePickers != null) {
      return File(imagePickers.path);
    } else {
      return toast(
          message: 'Please pick profile picture',
          color: DarkThemeColor.primary,
          title: 'Warning!');
    }
  }

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
