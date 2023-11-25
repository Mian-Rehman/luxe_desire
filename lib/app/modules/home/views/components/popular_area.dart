import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/modules/home/views/widgets/popular_widget.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/theme_controller.dart';

class PopularArea extends StatelessWidget {
  const PopularArea({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What else is popular',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: isDark ? DarkThemeColor.primary : Colors.black,
                fontSize: 18,
              ),
        ),
        SizedBox(
          height: 12.h,
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, listViewIndex) {
              return const PopularWidget();
            }),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
