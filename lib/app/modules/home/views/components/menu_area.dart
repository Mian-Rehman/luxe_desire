import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:luxe_desires/app/modules/eventScreen/views/event_screen_view.dart';
import 'package:luxe_desires/app/modules/home/views/widgets/category_widget.dart';
import 'package:luxe_desires/app/pages/reward_screen.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/theme_controller.dart';

class MenuArea extends StatelessWidget {
  const MenuArea({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Column(
      children: [
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryWidget(
              title: 'Food Menu',
              icon: Icons.restaurant_menu,
            ),
            CategoryWidget(
              title: 'Seesha Ordering',
              icon: Icons.smoking_rooms,
            ),

          ],
        ),

        SizedBox(height: 10,),
         Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
              Get.to(EventScreenView());
              },
              child:Container(
                width: 0.45.sw,
                height: 150.h,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26 : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.event,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 70,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Event",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Readex Pro',
                            color: isDark
                                ? DarkThemeColor.primary
                                : DarkThemeColor.alternate,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                Get.to(RewardScreen());
              },
              child:Container(
                width: 0.45.sw,
                height: 150.h,
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26: DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.currency_exchange,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 70,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Rewards",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Readex Pro',
                            color: isDark
                                ? DarkThemeColor.primary
                                : DarkThemeColor.alternate,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
