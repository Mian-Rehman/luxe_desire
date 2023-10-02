import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../constants/firebase.dart';

class HelpAndSupportController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final descController = TextEditingController();

  var loading = false.obs;
// Upload Product Data to Firestore
  uploadDataToDB() async {
    try {
      await firestore.collection('help&support').add({
        'name': nameController.text,
        'desc': descController.text,
        'email': emailController.text,
        'phoneNumber': phoneController.text,
        'userId': currentUser!.uid
      });
      toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: 'Upload Data Successfully',
      );
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      descController.clear();
    } catch (e) {
      debugPrint('Error#: ${e.toString()}');
    }
  }

  loader() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    loading.value = false;
  }
}
