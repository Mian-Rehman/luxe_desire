import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/menu_screen/widgets/category_widget.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import '../../constants/app_color.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  List menuList = ['Beverages', 'Food', 'Shisha', 'Merchandise'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
        centerTitle: true,
        backgroundColor: DarkThemeColor.primary,
        foregroundColor: DarkThemeColor.primaryText,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .4.h,
              width: double.infinity,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: menuList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: size.height * .15.h,
                      crossAxisCount: 2),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () =>
                          Get.to(() => CategoryPage(category: menuList[index])),
                      borderRadius: BorderRadius.circular(20),
                      child: ContainerWidget(
                          bgColor: DarkThemeColor.primary,
                          child: Text(
                            menuList[index],
                            style: GoogleFonts.readexPro(
                              color: DarkThemeColor.primaryText,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
