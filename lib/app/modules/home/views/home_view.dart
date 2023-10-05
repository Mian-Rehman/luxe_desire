import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/modules/home/views/components/menu_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/popular_area.dart';
import '../../../constants/firebase.dart';
import '../controllers/home_controller.dart';
import 'components/explore_area.dart';
import 'components/video_area.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  var controller = Get.put(HomeController());
  updateUser() async {
    Future.delayed(const Duration(seconds: 5), () async {
      if (controller.usersList.contains(currentUser!.uid)) {
      } else {
        await firestore
            .collection('users')
            .doc(currentUser!.uid)
            .update({'id': currentUser!.uid});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    firestore.collection('users').doc(auth.currentUser!.email).update({
      'uid': auth.currentUser!.uid,
    });
    log(auth.currentUser!.email.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  width: MediaQuery.sizeOf(context).width,
                  child: const Text(
                    "Welcome \n to Luxe Desires ",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const VideoArea(),
                const MenuArea(),
                const ExploreArea(),
                const SizedBox(
                  height: 20,
                ),
                const PopularArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
