import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../constants/theme_controller.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/input_feild.dart';
import '../controllers/guest_controller.dart';

class GuestlistScreen extends StatefulWidget {
  const GuestlistScreen({Key? key}) : super(key: key);

  @override
  State<GuestlistScreen> createState() => _GuestlistScreenState();
}

class _GuestlistScreenState extends State<GuestlistScreen> {
  var guestListColor = Colors.transparent;
  var tableServicesColor = Colors.transparent;

  var guestTextColor = Colors.white54;
  var tableTextColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var firstNameController = TextEditingController();
    final surNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final guestNameController = TextEditingController();
    final bothPackageController = TextEditingController();
    var controller = Get.put(GuestController());
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest List'),
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
                                labelText: 'Search for event name',
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
                                        icon: const Icon(Icons.calendar_month))
                                  ],
                                )),
                            SizedBox(
                              height: size.height * .02.h,
                            ),
                            SubmitButton(
                                bgColor: DarkThemeColor.primary,
                                title: 'Submit',
                                onTap: () {})
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        'Birthday',
                        style: GoogleFonts.readexPro(
                          color: isDark ? DarkThemeColor.primary : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .002.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "10:00 AM- 4:00 PM",
                            style: TextStyle(
                                fontSize: 15, color: DarkThemeColor.primary),
                          ),
                          SizedBox(
                            width: size.width * .06,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            style: GoogleFonts.readexPro(
                              color: DarkThemeColor.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      Text(
                        'Guest Booking',
                        style: GoogleFonts.readexPro(
                          color: DarkThemeColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      InputField(
                        labelText: 'First Name',
                        textInputAction: TextInputAction.next,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: firstNameController,
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      InputField(
                        labelText: 'Sur Name',
                        textInputAction: TextInputAction.next,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: surNameController,
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      InputField(
                        labelText: 'Email Address',
                        textInputAction: TextInputAction.next,
                        type: TextInputType.emailAddress,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: emailController,
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      InputField(
                        labelText: 'Phone Number',
                        textInputAction: TextInputAction.next,
                        type: TextInputType.phone,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: phoneNumberController,
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      ContainerWidget(
                          bgColor: DarkThemeColor.primaryText,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  controller.dob.value,
                                  style: GoogleFonts.readexPro(
                                    color: DarkThemeColor.secondaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () =>
                                      controller.getDOB(context: context),
                                  icon: const Icon(Icons.calendar_month))
                            ],
                          )),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      InputField(
                        labelText: 'Guest Name',
                        textInputAction: TextInputAction.next,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: guestNameController,
                      ),
                      SizedBox(
                        height: size.height * .01.h,
                      ),
                      ContainerWidget(
                          bgColor: DarkThemeColor.primaryText,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  controller.dateList.value,
                                  style: GoogleFonts.readexPro(
                                    color: DarkThemeColor.secondaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () =>
                                      controller.getDOList(context: context),
                                  icon: const Icon(Icons.calendar_month))
                            ],
                          )),
                      SizedBox(
                        height: size.height * .02.h,
                      ),
                      InputField(
                        labelText: 'Booth Package',
                        textInputAction: TextInputAction.next,
                        validatior: (value) {
                          if (value.toString().isEmpty) {
                            return '';
                          }
                        },
                        inputController: bothPackageController,
                      ),
                      SizedBox(
                        height: size.height * .02.h,
                      ),
                      SubmitButton(
                          bgColor: DarkThemeColor.primary,
                          title: 'Submit',
                          onTap: () {
                            showBox(
                                confirmText: 'OK',
                                title: 'Thanks',
                                desc:
                                    "Thank you for choosing us for your next event and we can't wait to see you and all your friends! We have received your booking and will be in touch shortly to confirm.",
                                confirm: () => Get.back());
                          })
                    ])),
            SizedBox(
              height: size.height * .02.h,
            ),
          ],
        ),
      ),
    );
  }
}
