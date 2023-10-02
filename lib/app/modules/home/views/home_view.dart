import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/modules/home/views/components/menu_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/popular_area.dart';
import '../controllers/home_controller.dart';
import 'components/explore_area.dart';
import 'components/video_area.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
