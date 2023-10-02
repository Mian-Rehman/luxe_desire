import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/order/views/components/gird_area.dart';
import 'package:luxe_desires/app/modules/order/views/components/info_form.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';

import '../controllers/order_controller.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        foregroundColor: DarkThemeColor.primaryText,
        title: Text(
          'Orders',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 19.sp,
              ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * .75,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ContainerWidget(
                        width: double.infinity,
                        height: size.height * .2.h,
                        bgColor: DarkThemeColor.secondaryBackground,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Order Date:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: DarkThemeColor.alternate,
                                        fontSize: 15.sp,
                                      ),
                                ),
                                Text(
                                  DateFormat('dd-MM-yy').format(DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: DarkThemeColor.alternate,
                                        fontSize: 17.sp,
                                      ),
                                ),
                                Text(
                                  'Order Total:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: DarkThemeColor.alternate,
                                        fontSize: 15.sp,
                                      ),
                                ),
                                Text(
                                  '\$150.07',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: DarkThemeColor.alternate,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '(3 items)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: DarkThemeColor.alternate,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            SizedBox(
                              width: size.width * .6.w,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    'assets/imgs/Logo.png',
                                    'assets/imgs/house.jpg',
                                    'assets/imgs/night.jpg'
                                  ]
                                      .map((e) => Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              e,
                                            ),
                                          )))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .04,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: ContainerWidget(
                width: double.infinity,
                height: size.height * .07.h,
                bgColor: DarkThemeColor.secondaryBackground,
                child: Row(
                  children: [
                    const Icon(
                      Icons.bus_alert,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: size.width * .03,
                    ),
                    Text(
                      'Reorder',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Readex Pro',
                          color: DarkThemeColor.alternate,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '(Expected by 06 Nov 2023)',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Readex Pro',
                          color: DarkThemeColor.alternate,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
