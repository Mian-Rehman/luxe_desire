import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/musiclist/views/widgets/widgets.dart';
import '../../../constants/theme_controller.dart';
import '../../../widgets/input_feild.dart';
import '../controllers/musiclist_controller.dart';

class MusiclistView extends GetView<MusiclistController> {
  const MusiclistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var searchMusicController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: DarkThemeColor.primary,
          foregroundColor: DarkThemeColor.primaryText,
          title: Text(
            'Music Streaming',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Readex Pro',
                  color: DarkThemeColor.alternate,
                  fontSize: 19.sp,
                ),
          ),
          centerTitle: true,
          elevation: 4,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imgs/bg.jpg'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                    labelText: 'Search DJ or Genre',
                    validatior: (value) {},
                    suffix: CupertinoIcons.search,
                    suffixPress: () {},
                    inputController: searchMusicController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Library",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 240.w,
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10, right: 20),
                          decoration: BoxDecoration(
                            color: !isDark
                                ? LightThemeColor.primary
                                : Colors.black.withOpacity(.6),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x520E151B),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png",
                                  width: 180.w,
                                  height: 150.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jamies',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      '[rock music]',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recently played",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 240.w,
                  child: ListView.builder(
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10, right: 20),
                          decoration: BoxDecoration(
                            color: !isDark
                                ? LightThemeColor.primary
                                : Colors.black.withOpacity(.6),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x520E151B),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png",
                                  width: 180.w,
                                  height: 150.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jamies',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      Text(
                                        '[rock music]',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Browse All",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BrowseWidget(
                        image: 'assets/imgs/rnb.png',
                        name: 'RnB',
                        press: () => Get.to(const MusicPlayListWidget())),
                    BrowseWidget(
                        image: 'assets/imgs/minimal.jpg',
                        name: 'Minimal',
                        press: () => Get.to(const MusicPlayListWidget())),
                    BrowseWidget(
                        image: 'assets/imgs/house.jpg',
                        name: 'House',
                        press: () => Get.to(const MusicPlayListWidget())),
                  ],
                ),
                SizedBox(
                  height: size.height * .02.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BrowseWidget(
                        image: 'assets/imgs/techno.jpg',
                        name: 'Techno',
                        press: () => Get.to(const MusicPlayListWidget())),
                    BrowseWidget(
                        image: 'assets/imgs/hardstyle.jpg',
                        name: 'Hardstyle',
                        press: () => Get.to(const MusicPlayListWidget())),
                    BrowseWidget(
                        image: 'assets/imgs/rap.jpg',
                        name: 'Rap',
                        press: () => Get.to(const MusicPlayListWidget())),
                  ],
                ),
                SizedBox(
                  height: size.height * .02.h,
                ),
                BrowseWidget(
                    image: 'assets/imgs/afro.jpg',
                    name: 'Afro',
                    press: () => Get.to(const MusicPlayListWidget())),
                // const Text(
                //   "Your Favorite Artist",
                //   style: TextStyle(fontSize: 17),
                // ),
                // Container(
                //   height: 120.w,
                //   padding: const EdgeInsets.only(top: 10, right: 20),
                //   child: ListView.builder(
                //       primary: false,
                //       shrinkWrap: true,
                //       physics: const BouncingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 5,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           padding: const EdgeInsets.only(top: 10, right: 20),
                //           decoration: BoxDecoration(
                //             boxShadow: const [
                //               BoxShadow(
                //                 blurRadius: 4,
                //                 color: Color(0x520E151B),
                //                 offset: Offset(0, 2),
                //               )
                //             ],
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           child: const Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               CircleAvatar(
                //                 backgroundColor: Colors.black26,
                //                 backgroundImage: NetworkImage(
                //                     "https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png"),
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Text(
                //                 'Jamies',
                //                 style: TextStyle(fontSize: 12),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
              ],
            ),
          ),
        ));
  }
}
