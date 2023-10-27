import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../constants/firebase.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/submit_button.dart';
import 'cart_page_widget.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key, required this.categoryName});
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
      body: StreamBuilder(
          stream: firestore
              .collection('menu')
              .where('subMenu', isEqualTo: categoryName)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      mainAxisExtent: size.height * .38,
                      crossAxisSpacing: 20),
                  itemBuilder: (_, index) {
                    var data = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ContainerWidget(
                        bgColor: DarkThemeColor.primaryText,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data['image'],
                                width: size.width,
                                height: size.height * .075.h,
                              ),
                            ),
                            Text(
                              '${data['name']}',
                              style: GoogleFonts.readexPro(
                                color: DarkThemeColor.secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              '${data['desc']}',
                              style: GoogleFonts.readexPro(
                                color: DarkThemeColor.secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              '\$${data['price']}',
                              style: GoogleFonts.readexPro(
                                color: DarkThemeColor.secondaryText,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              '${data['pts']}+ pts',
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
                                onTap: () => Get.to(() => CartPageWidget(
                                      productName: data['name'],
                                      price: data['price'],
                                    ))),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return loader;
            }
          }),
    );
  }
}
