import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_desires/app/modules/menu_screen/widgets/cart_page_widget.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/submit_button.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
        backgroundColor: DarkThemeColor.primary,
        foregroundColor: DarkThemeColor.primaryText,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: size.height * .38.h,
              crossAxisCount: 2),
          itemBuilder: (_, index) {
            return ContainerWidget(
                bgColor: DarkThemeColor.primaryText,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/imgs/Logo.png',
                        width: size.width,
                        height: size.height * .075.h,
                      ),
                    ),
                    Text(
                      'Luxe Desires',
                      style: GoogleFonts.readexPro(
                        color: DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      'Description of that item Luxe Desires',
                      style: GoogleFonts.readexPro(
                        color: DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      'Price: \$500',
                      style: GoogleFonts.readexPro(
                        color: DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      '2000+ Pts',
                      style: GoogleFonts.readexPro(
                        color: DarkThemeColor.secondaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    SubmitButton(
                      bgColor: DarkThemeColor.primary,
                      title: 'Add to cart',
                      onTap: () => Get.to(
                          () => const CartPageWidget(productName: 'Coca cola')),
                    )
                  ],
                ));
          }),
    );
  }
}
