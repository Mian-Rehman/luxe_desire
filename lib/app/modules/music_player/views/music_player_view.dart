import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import '../controllers/music_player_controller.dart';

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var pageController = PageController();
    return GetBuilder<MusicPlayerController>(
        init: MusicPlayerController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: !isDark
                  ? LightThemeColor.primaryText
                  : DarkThemeColor.alternate,
            ),
            body: StreamBuilder(
                stream: firestore.collection('music').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: pageController,
                        itemCount: snapshot.data!.docs.length,
                        onPageChanged: (value) {},
                        itemBuilder: (_, index) {
                          var data = snapshot.data!.docs[index];
                          return Column(
                            children: [
                              Container(
                                width: double.infinity.w,
                                height: 400.h,
                                decoration: BoxDecoration(
                                  color: !isDark
                                      ? LightThemeColor.secondaryBackground
                                      : DarkThemeColor.secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 9,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                      spreadRadius: 8,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    data['image'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          data['name'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                color: !isDark
                                                    ? LightThemeColor
                                                        .primaryText
                                                    : DarkThemeColor.alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          data['artistName'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: !isDark
                                                    ? LightThemeColor
                                                        .primaryText
                                                    : DarkThemeColor.alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * .05.w,
                                    ),
                                    Bounce(
                                      onPressed: () {},
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Icon(
                                        Icons.favorite,
                                        color: DarkThemeColor.primary,
                                        size: 30,
                                      ),
                                    ),
                                    Bounce(
                                      onPressed: () {},
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Image.asset(
                                        'assets/imgs/fb.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .03.w,
                                    ),
                                    Bounce(
                                      onPressed: () {},
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Image.asset(
                                        'assets/imgs/insta.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 20.h),
                                decoration: BoxDecoration(
                                    color: !isDark
                                        ? LightThemeColor.secondaryBackground
                                        : DarkThemeColor.secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Obx(
                                  () => Row(
                                    children: [
                                      Text(
                                        controller.position.value.toString(),
                                        style: TextStyle(
                                            color: DarkThemeColor.primaryText),
                                      ),
                                      Slider(
                                          min: const Duration(seconds: 0)
                                              .inSeconds
                                              .toDouble(),
                                          max: controller.max.value,
                                          value: controller.value.value,
                                          activeColor: isDark
                                              ? DarkThemeColor.primary
                                              : LightThemeColor.primary,
                                          inactiveColor: isDark
                                              ? DarkThemeColor.alternate
                                              : LightThemeColor
                                                  .primaryBackground,
                                          onChanged: (value) {
                                            controller.changeDurationToSeconds(
                                                value.toInt());
                                          }),
                                      Text(
                                        controller.duration.value.toString(),
                                        style: TextStyle(
                                            color: DarkThemeColor.primaryText),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: const Card(
                                        color: Colors.black26,
                                        child: Icon(
                                          Icons.earbuds,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Bounce(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      onPressed: () =>
                                          pageController.previousPage(
                                              duration:
                                                  const Duration(seconds: 2),
                                              curve: Curves.bounceInOut),
                                      child: const Card(
                                          color: Colors.black26,
                                          child: Icon(
                                            Icons.arrow_circle_left,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Bounce(
                                    duration: const Duration(milliseconds: 200),
                                    onPressed: () => controller
                                        .playAndStopAudio(url: data['audio']),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: const EdgeInsets.only(
                                          left: 30, top: 5),
                                      child: controller.isPlaying == false
                                          ? Image.asset("assets/imgs/play.png")
                                          : Image.asset(
                                              "assets/imgs/pause.png"),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Bounce(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      onPressed: () => pageController.nextPage(
                                          duration: const Duration(seconds: 2),
                                          curve: Curves.bounceInOut),
                                      child: const Card(
                                          color: Colors.black26,
                                          child: Icon(
                                            Icons.arrow_circle_right,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: const Card(
                                        color: Colors.black26,
                                        child: Icon(
                                          Icons.earbuds,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );
        });
  }
}
