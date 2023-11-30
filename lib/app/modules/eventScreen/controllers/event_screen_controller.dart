import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/data/models/events.dart';

class EventScreenController extends GetxController {
  final eventController = Get.put(Events());
  var isLoading = false.obs;
  var selectedDate = DateTime.now().obs;
  List<Event> events = [];
  final count = 0.obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  void increment() => count.value++;

 

  fetchEvents() {
    isLoading.value = true;
    eventController.fetchAndSetEvents().then((value) {
      isLoading.value = false;

      events = eventController.events;
    });
  }

  bookEvent(
      {required String image,
      required String name,
      required String desc,
      required String date,
      required double reward,
      required String fee,
      required String time,
      required String bookingId,
      required String bookDate,
      required String userName,
      required String phoneNumber,
      required String email,
      required String bookTime}) async {
    try {
      await firestore.collection('booking').add({
        'userName': userName,
        'phoneNumber': phoneNumber,
        'email': email,
        'image': image,
        'name': name,
        'desc': desc,
        'uid': auth.currentUser!.uid,
        'fee': fee,
        'eventDate': date,
        'bookingNo': bookingId,
        'eventTime': time,
        'bookDate': bookDate,
        'bookTime': bookTime,
      });
      await firestore
          .collection('users')
          .doc(auth.currentUser!.email)
          .update({'reward': reward});
    } catch (e) {
      log(e.toString());
    }
  }

  editEvent({required String id, required double reward}) async {
    try {
      await firestore.collection('booking').doc(id).update({'booked': 'Yes'});

      toast(
          message: 'Your seat booked',
          color: DarkThemeColor.primary,
          title: 'Successfully!');
    } catch (e) {
      log(e.toString());
    }
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
}
