import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/eventScreen/controllers/event_screen_controller.dart';
import 'package:luxe_desires/app/pages/event_details_screen.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:url_launcher/url_launcher.dart';

class EventScreenView extends StatelessWidget {
  const EventScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var priceController = TextEditingController();
    var controller = Get.put(EventScreenController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('EventScreenView'),
          centerTitle: true,
          backgroundColor: DarkThemeColor.primary,
          foregroundColor: DarkThemeColor.primaryText,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(10),
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              InputField(
                                  labelText: 'Search for venue',
                                  validatior: (value) {},
                                  suffix: CupertinoIcons.search,
                                  suffixPress: () {},
                                  inputController: searchController),
                              SizedBox(
                                height: size.height * .02.h,
                              ),
                              ContainerWidget(
                                  bgColor: DarkThemeColor.primaryText,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          DateFormat('yyyy-MM-dd').format(
                                              controller.selectedDate.value),
                                          style: GoogleFonts.readexPro(
                                            color: DarkThemeColor.secondaryText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () => controller.getDate(
                                              context: context),
                                          icon:
                                              const Icon(Icons.calendar_month))
                                    ],
                                  )),
                              SizedBox(
                                height: size.height * .02.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Enter price',
                                    style: GoogleFonts.readexPro(
                                      color: DarkThemeColor.primary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '0\$ - 100\$',
                                        style: GoogleFonts.readexPro(
                                          color: DarkThemeColor.primary,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .007,
                                      ),
                                      SizedBox(
                                        width: size.width * .3.w,
                                        height: size.height * .07,
                                        child: InputField(
                                            type: TextInputType.number,
                                            labelText: 'Price',
                                            validatior: (value) {},
                                            isContentPadding: true,
                                            inputController: priceController),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        backgroundColor: DarkThemeColor.primaryBackground,
                        ignoreSafeArea: true,
                        isScrollControlled: true);
                  },
                  icon: const Icon(CupertinoIcons.search)),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity.w,
              height: size.height * .3.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/imgs/night.jpg'))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Marquee',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .002.h,
                  ),
                  Text(
                    '3708 S Las Vegas',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .002.h,
                  ),
                  Text(
                    'Las Vegas, NV89109, USA',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .002.h,
                  ),
                  Text(
                    '+1 702-333-9000',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rowWidget(
                          image: 'assets/imgs/fb.png',
                          text: 'Facebook',
                          press: () {}),
                      rowWidget(
                          image: 'assets/imgs/insta.png',
                          text: 'Instagram',
                          press: () {}),
                      rowWidget(
                          image: 'assets/imgs/web.png',
                          text: 'Website',
                          press: () {}),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Text(
                    'Upcoming Events',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                
                  SizedBox(
                    width: double.infinity,
                    height: size.height * .3.h,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(
                                        'https://www.eventbrite.com.au/e/daniela-corso-band-live-at-the-palace-hotel-tickets-564872568057?aff=erelexpmlt&keep_tld=1');
                                    if (!await launchUrl(url,
                                        mode: LaunchMode.externalApplication)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity.w,
                                    height: size.height * .4.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/imgs/event.jpg'))),
                                  ),
                                ),
                                Text(
                                  'Luxe Desires Angels',
                                  style: GoogleFonts.readexPro(
                                    color: DarkThemeColor.primary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  'Friday 17th, June 2023 9:00 PM',
                                  style: GoogleFonts.readexPro(
                                    color: DarkThemeColor.secondaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  InkWell rowWidget(
      {required String image,
      required String text,
      required Function() press}) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: DarkThemeColor.primary,
        ),
        width: size.width * .28.w,
        height: size.height * .05.h,
        child: Row(
          children: [
            Image.asset(
              image,
              width: 35,
              height: 35,
            ),
            SizedBox(
              width: size.width * .004,
            ),
            Text(
              text,
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
