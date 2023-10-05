import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
