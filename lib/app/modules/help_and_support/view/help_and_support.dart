import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/modules/help_and_support/controllers/help_controller.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/input_feild.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var controller = Get.put(HelpAndSupportController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        title: Text(
          'Help & Support',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 19,
              ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get in Touch',
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  'First Name',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primaryText,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 10,
                )
              ],
            ),
            InputField(
              labelText: '',
              hintText: 'First Name',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
              bdColor: DarkThemeColor.alternate,
              inputController: controller.nameController,
              isContentPadding: false,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Text(
                  'Email',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primaryText,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 10,
                )
              ],
            ),
            InputField(
              labelText: '',
              hintText: 'Email Address',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              type: TextInputType.emailAddress,
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
              bdColor: DarkThemeColor.alternate,
              inputController: controller.emailController,
              isContentPadding: false,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Text(
                  'Phone Number',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primaryText,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 10,
                )
              ],
            ),
            InputField(
              type: TextInputType.phone,
              textInputAction: TextInputAction.next,
              hintText: 'Phone Number',
              labelText: '',
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
              bdColor: DarkThemeColor.alternate,
              inputController: controller.phoneController,
              isContentPadding: false,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Text(
                  'Message',
                  style: GoogleFonts.readexPro(
                    color: DarkThemeColor.primaryText,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 10,
                )
              ],
            ),
            InputField(
              labelText: '',
              hintText: 'Message...',
              textInputAction: TextInputAction.next,
              validatior: (value) {
                if (value.toString().isEmpty) {
                  return '';
                }
              },
              bgColor: isDark
                  ? LightThemeColor.primaryBackground
                  : DarkThemeColor.secondaryBackground,
              bdColor: LightThemeColor.alternate,
              maxLines: 5,
              inputController: controller.descController,
              isContentPadding: false,
            ),
            SizedBox(
              height: 24.h,
            ),
            Obx(() => controller.loading.value == false
                ? SubmitButton(
                    title: 'Send',
                    onTap: () {
                      if (controller.nameController.text.isNotEmpty &&
                          controller.emailController.text.isNotEmpty &&
                          controller.phoneController.text.isNotEmpty &&
                          controller.descController.text.isNotEmpty) {
                        controller.loader();
                        controller.uploadDataToDB();
                      } else {
                        toast(
                            message: 'Please fill all required fields',
                            color: DarkThemeColor.primary,
                            title: 'Alert!');
                      }
                    },
                    width: double.infinity.w,
                    height: 50.h,
                    textColor: DarkThemeColor.primaryText,
                    bgColor: DarkThemeColor.primary,
                  )
                : ContainerWidget(
                    bgColor: DarkThemeColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Loading...',
                            style: GoogleFonts.readexPro(
                              color: !isDark
                                  ? LightThemeColor.primaryText
                                  : DarkThemeColor.primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ))),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Find Us',
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/imgs/map.jpg',
                height: size.height * .25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              '123 Queen St, Melbourne\n03087947982',
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            Text(
              'Email:test@gmail.com',
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imgs/fb.png',
                  width: 50,
                  height: 50,
                ),
                Image.asset(
                  'assets/imgs/insta.png',
                  width: 30,
                  height: 30,
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "FAQ's",
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            Text(
              'Most frequest questions and answers',
              style: GoogleFonts.readexPro(
                color: DarkThemeColor.primary,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            faqMethod(
                width: size.width * .45,
                context: context,
                subtitle:
                    'Fill out the form and we’ll contact you for more details.',
                title: 'HOW DO I JOIN AS DJ?'),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
                width: size.width * .77,
                context: context,
                subtitle: 'Yes you can Definitely join.',
                title: 'IF NOT FROM AUSTRALIA, CAN I JOIN?'),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
                width: size.width * .78,
                context: context,
                subtitle: 'Yes! we do.',
                title: 'WE OFFER DISCOUNTS AND COUPONS?'),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
                width: size.width * .78,
                context: context,
                subtitle:
                    "To join as a DJ, simply complete the form, and we'll reach out to you for additional information.",
                title: 'How Can I Become a DJ Member?'),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
              width: size.width * .78,
              context: context,
              subtitle:
                  "Absolutely! You are welcome to join regardless of your location.",
              title: "Can I Join if I'm Not Located in Australia?",
            ),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
              width: size.width * .78,
              context: context,
              subtitle: "Yes, we offer discounts and coupons to our members.",
              title: "Do You Provide Discounts and Coupons?",
            ),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
              width: size.width * .78,
              context: context,
              subtitle:
                  "Membership requirements may vary. Typically, you'll need to meet certain criteria, such as having DJ experience or an interest in becoming a DJ. Please contact us for specific details.",
              title: "What Are the Membership Requirements?",
            ),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
              width: size.width * .78,
              context: context,
              subtitle:
                  "We regularly update our members with event information and news through newsletters, email, and our website. Make sure to keep your contact information up-to-date to receive the latest updates",
              title: "How Do I Stay Updated on DJ Events\nand News?",
            ),
            SizedBox(
              height: size.height * .02,
            ),
            faqMethod(
              width: size.width * .78,
              context: context,
              subtitle:
                  "- If you have additional questions or require support, please reach out to our customer support team through our contact page. We're here to help you with any inquiries or concerns you may have.",
              title: "What If I Have More Questions\nor Need Support?",
            ),
            SizedBox(
              height: size.height * .05,
            ),
          ],
        ),
      ),
    );
  }

  faqMethod(
      {required BuildContext context,
      required String title,
      subtitle,
      required double width}) {
    return ExpansionTile(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: DarkThemeColor.primary)),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'Readex Pro',
            color: DarkThemeColor.alternate,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
