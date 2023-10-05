import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/firebase.dart';

class HomeController extends GetxController {
  List<dynamic> usersList = [];
  getUsers() async {
    QuerySnapshot querySnapshot = await firestore.collection('users').get();
    usersList = querySnapshot.docs.map((doc) => doc.get('uid')).toList();
    update();
    debugPrint('Users......${usersList.toString()}');
  }

  @override
  void onReady() {
    getUsers();
    super.onReady();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
