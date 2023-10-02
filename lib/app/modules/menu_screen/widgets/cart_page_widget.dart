import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:luxe_desires/app/widgets/submit_button.dart';
import '../../../constants/app_color.dart';

class CartPageWidget extends StatelessWidget {
  const CartPageWidget({super.key, required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        centerTitle: true,
        backgroundColor: DarkThemeColor.primary,
        foregroundColor: DarkThemeColor.primaryText,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ContainerWidget(
              width: double.infinity,
              height: size.height * .43.h,
              bgColor: DarkThemeColor.secondaryBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'Below is the list of items in your cart.',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05.h,
                  ),
                  Text(
                    'Order Summary',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'Below is a list of your items.',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: DarkThemeColor.primaryText,
                  ),
                  Text(
                    'Price Breakdown',
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                  rowMethod(
                      title: 'Base Price',
                      desc: '0.0',
                      isIcon: false,
                      titleFont: 15.h,
                      descFont: 14.h),
                  rowMethod(
                      title: 'Taxes',
                      desc: '24.50',
                      isIcon: false,
                      titleFont: 15.h,
                      descFont: 14.h),
                  rowMethod(
                      title: 'Cleaning Fee',
                      desc: '50.00',
                      isIcon: false,
                      titleFont: 15.h,
                      descFont: 14.h),
                  SizedBox(
                    height: size.height * .02.h,
                  ),
                  rowMethod(
                      title: 'Total',
                      desc: '75.50',
                      isIcon: true,
                      titleFont: 25.h,
                      descFont: 30.h),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .05.h,
            ),
            SubmitButton(
                bgColor: DarkThemeColor.primary,
                title: 'Continue Shopping',
                onTap: () => Get.back()),
            SizedBox(
              height: size.height * .02.h,
            ),
            SubmitButton(
                bgColor: DarkThemeColor.primary,
                title: 'Continue to Checkout',
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Row rowMethod(
      {required String title,
      required String desc,
      required bool isIcon,
      required double titleFont,
      required double descFont}) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.readexPro(
            color: DarkThemeColor.secondaryText,
            fontWeight: FontWeight.w500,
            fontSize: titleFont,
          ),
        ),
        SizedBox(
          width: size.width * .02.w,
        ),
        isIcon == false
            ? const SizedBox()
            : Icon(
                Icons.info,
                color: DarkThemeColor.primaryText,
                size: 25,
              ),
        const Spacer(),
        Text(
          '\$$desc',
          style: GoogleFonts.readexPro(
            color: DarkThemeColor.primaryText,
            fontWeight: FontWeight.w500,
            fontSize: descFont,
          ),
        ),
      ],
    );
  }
}
