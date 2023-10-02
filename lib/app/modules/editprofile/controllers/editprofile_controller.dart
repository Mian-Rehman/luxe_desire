import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../constants/firebase.dart';

class EditprofileController extends GetxController {
  final nameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  var loading = false.obs;

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

  updateProfile({required String id, required File image}) async {
    try {
      final String imageUrl = await firebaseStorage(image: image);
      await firestore.collection('users').doc(id).update({
        'userName': nameController.text,
        'email': emailAddressController.text,
        'phoneNumber': phoneNumberController.text,
        'profilePic': imageUrl
      });
      toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: 'Profile Updated Successfully',
      );
      Get.back();
    } catch (e) {
      debugPrint('Error#: ${e.toString()}');

      return toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: e.toString(),
      );
    }
  }
}
