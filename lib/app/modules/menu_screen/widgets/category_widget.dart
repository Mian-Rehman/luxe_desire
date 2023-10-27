import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../widgets/container_widget.dart';
import 'items_widget.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, required this.category});
  final String category;

  List beveragesList = [
    'Spirits',
    'Wine',
    'Beer',
    'Pre-Mixed',
    'Cocktail',
    'Mocktail',
    'Soft Drink'
  ];
  List foodList = ['Small Bites', 'Platters'];
  List shishaList = ['Normal Head', 'Fresh Head', 'Extra'];
  List merchandiseList = [
    'Clothing',
    'Wristbands',
    'Landyard',
    'Phone Accessories',
    'Keyrings'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        foregroundColor: DarkThemeColor.primaryText,
        centerTitle: true,
        backgroundColor: DarkThemeColor.primary,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: category == 'Beverages'
              ? beveragesList.length
              : category == 'Food'
                  ? foodList.length
                  : category == 'Shisha'
                      ? shishaList.length
                      : merchandiseList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: size.height * .15.h,
              crossAxisCount: 2),
          itemBuilder: (_, index) {
            var data = category == 'Beverages'
                ? beveragesList[index]
                : category == 'Food'
                    ? foodList[index]
                    : category == 'Shisha'
                        ? shishaList[index]
                        : merchandiseList[index];
            return InkWell(
              onTap: () => Get.to(() => ItemsWidget(
                    categoryName: data,
                  )),
              borderRadius: BorderRadius.circular(20),
              child: ContainerWidget(
                  bgColor: DarkThemeColor.primary,
                  child: Text(
                    data,
                    style: GoogleFonts.readexPro(
                      color: DarkThemeColor.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  )),
            );
          }),
    );
  }
}
