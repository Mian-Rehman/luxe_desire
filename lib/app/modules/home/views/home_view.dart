import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/modules/home/views/components/explore_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/menu_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/popular_area.dart';
import 'package:luxe_desires/app/modules/home/views/components/video_area.dart';
import 'package:luxe_desires/app/modules/home/views/widgets/videoplayer_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Text("Luxe Desires"))
          ],
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            backgroundColor: DarkThemeColor.primary,
            automaticallyImplyLeading: false,
            title: Text(
              'Luxe Desires',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: !isDark
                        ? LightThemeColor.alternate
                        : DarkThemeColor.alternate,
                    fontSize: 19.sp,
                  ),
            ),
            actions: [
              Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Icon(
                    Icons.menu,
                    color: !isDark
                        ? LightThemeColor.alternate
                        : DarkThemeColor.alternate,
                    size: 24,
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          )
        ],
        body: Builder(builder: (context) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Container(
                      margin: EdgeInsets.only(top: 30,bottom: 30),
                      width: MediaQuery.sizeOf(context).width,
                      child: Text("Welcome \n to Luxe Desires ",style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // const VideoArea(),
                    const MenuArea(),
                    // const ExploreArea(),


                    SizedBox(height: 20,),

                    InkWell(
                      onTap: (){
                        Get.to(() => const VideoPlayerScreen(
                            url:
                            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4'));

                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: DarkThemeColor.primary,
                        ),
                        child: Center(child: Text("Explore Now")),

                      ),
                    ),

                    SizedBox(height: 10,),
                    const PopularArea(),
                    Text(
                      'Other Stays',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
