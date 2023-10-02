import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import '../../../constants/firebase.dart';

class JoinTeamController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var dob = "Date of Birth".obs;
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final descController = TextEditingController();
  final fbController = TextEditingController();
  final instaController = TextEditingController();
  final dobController = TextEditingController();
  final soundBandController = TextEditingController();
  List attendance = [
    'DJ',
    'Entertainer',
    'Host',
    'Model',
  ];
  List<dynamic> usersList = [];
  var selectedValue = 'DJ'.obs;
  var loading = false.obs;
// Upload Product Data to Firestore
  updatedDataToDB() async {
    try {
      await firestore.collection('team').doc(currentUser!.uid).set({
        'surName': surNameController.text,
        'name': nameController.text,
        'desc': descController.text,
        'email': emailController.text,
        'phoneNumber': phoneController.text,
        'dob': dobController.text,
        'role': selectedValue.toString(),
        'fb': fbController.text,
        'insta': instaController.text,
        'soundCloud': soundBandController.text,
        'userId': currentUser!.uid,
        'status': 'Pending',
        'datetime': DateTime.now()
      });
      toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: 'Upload Data Successfully',
      );
      nameController.clear();
      surNameController.clear();
      phoneController.clear();
      emailController.clear();
      dobController.clear();
      descController.clear();
      fbController.clear();
      instaController.clear();
      soundBandController.clear();
    } catch (e) {
      debugPrint('Error#: ${e.toString()}');
      return toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: e.toString(),
      );
    }
  }

  // Upload Product Data to Firestore
  uploadDataToDB() async {
    try {
      await firestore.collection('team').doc(currentUser!.uid).update({
        'surName': surNameController.text,
        'name': nameController.text,
        'desc': descController.text,
        'email': emailController.text,
        'phoneNumber': phoneController.text,
        'dob': dobController.text,
        'role': selectedValue.toString(),
        'fb': fbController.text,
        'insta': instaController.text,
        'soundCloud': soundBandController.text,
        'userId': currentUser!.uid,
        'datetime': DateTime.now()
      });
      toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: 'Updated Data Successfully',
      );
      nameController.clear();
      surNameController.clear();
      phoneController.clear();
      emailController.clear();
      dobController.clear();
      descController.clear();
      fbController.clear();
      instaController.clear();
      soundBandController.clear();
    } catch (e) {
      debugPrint('Error#: ${e.toString()}');
      return toast(
        color: DarkThemeColor.primary,
        title: 'Alert!',
        message: e.toString(),
      );
    }
  }

  getUsers() async {
    QuerySnapshot querySnapshot = await firestore.collection('team').get();
    usersList = querySnapshot.docs.map((doc) => doc.get('userId')).toList();
    update();
    debugPrint('Users......${usersList.toString()}');
  }

  loader() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    loading.value = false;
  }

  checkBox({required dynamic check}) {
    selectedValue.value = check;
    update();
  }

  getDate({required BuildContext context}) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickDate != null) {
      selectedDate.value = pickDate;
      update();
    } else {}
    update();
    print(selectedDate);
  }

  getDOB({required BuildContext context}) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickDate != null) {
      dob.value = DateFormat('yyyy-MM-dd').format(pickDate);

      update();
    } else {}
    update();
    print(dob);
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
