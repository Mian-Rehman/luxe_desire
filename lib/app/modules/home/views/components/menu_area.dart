import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/eventScreen/views/event_screen_view.dart';
import 'package:luxe_desires/app/modules/guestlist_page/views/guestlist_view.dart';
import 'package:luxe_desires/app/modules/menu_screen/menu_screen.dart';
import 'package:luxe_desires/app/routes/app_pages.dart';

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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.to(() => const EventScreenView());
              },
              child: Container(
                width: 0.45.sw,
                height: 155.h,
                decoration: BoxDecoration(
                  // color: isDark
                  //     ? DarkThemeColor.secondaryBackground
                  //     : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.event,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Events",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
            SizedBox(
                height: size.height * .15,
                child: const VerticalDivider(
                  color: Colors.white24,
                )),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.toNamed(Routes.MUSICLIST);
              },
              child: Container(
                width: 0.45.sw,
                height: 155.h,
                decoration: BoxDecoration(
                  // color: isDark ? Colors.black26 : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.music_note_outlined,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Music",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: size.width * .3,
                child: const Divider(
                  color: Colors.white24,
                )),
            SizedBox(
                width: size.width * .3,
                child: const Divider(color: Colors.white24)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Get.to(() => const GuestlistScreen()),
              child: Container(
                width: 0.45.sw,
                height: 155.h,
                decoration: BoxDecoration(
                  // color: isDark ? Colors.black26 : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.person,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Guest Lists",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
            SizedBox(
                height: size.height * .15,
                child: const VerticalDivider(
                  color: Colors.white24,
                )),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => Get.to(MenuScreen()),
              child: Container(
                width: 0.45.sw,
                height: 155.h,
                decoration: BoxDecoration(
                  // color: isDark ? Colors.black26 : DarkThemeColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.w, 20.h, 10.w, 20.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.menu,
                        color: isDark
                            ? DarkThemeColor.primary
                            : DarkThemeColor.alternate,
                        size: 50,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15.h, 0, 0),
                        child: Text(
                          "Menu",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
