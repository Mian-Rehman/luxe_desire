import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GuestController extends GetxController {
  final String imageUrl = '';
  final String audioUrl = '';

  var selectedDate = DateTime.now().obs;
  var dob = "Date of Birth".obs;
  var dateList = "Date of List".obs;

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

  getDOList({required BuildContext context}) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickDate != null) {
      dateList.value = DateFormat('yyyy-MM-dd').format(pickDate);

      update();
    } else {}
    update();
    print(dob);
  }
}
