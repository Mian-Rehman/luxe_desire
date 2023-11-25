import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../constants/app_color.dart';
import '../../constants/contants.dart';
import '../../constants/firebase.dart';
import '../../constants/theme_controller.dart';
import '../../widgets/container_widget.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking List'),
          centerTitle: true,
          backgroundColor: DarkThemeColor.primary,
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          height: size.height.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      DarkThemeColor.secondaryBackground,
                      DarkThemeColor.error,
                      DarkThemeColor.tertiary,
                    ]
                  : [
                      LightThemeColor.primary,
                      LightThemeColor.error,
                      LightThemeColor.tertiary,
                    ],
              stops: const [0, 0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        DarkThemeColor.primaryBackground,
                        DarkThemeColor.primary,
                      ]
                    : [
                        LightThemeColor.primary,
                        LightThemeColor.secondaryBackground,
                      ],
                stops: const [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: StreamBuilder(
                stream: firestore
                    .collection('booking')
                    .where('uid', isEqualTo: auth.currentUser!.uid)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!.docs.isEmpty
                        ? Center(
                            child: Text(
                              'Still, you not booked anything',
                              style: TextStyle(
                                color: isDark
                                    ? DarkThemeColor.primary
                                    : Colors.black,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, index) {
                              var data = snapshot.data!.docs[index];
                              return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ContainerWidget(
                                    width: double.infinity,
                                    height: size.height * .56,
                                    bgColor: DarkThemeColor.primary,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                              duration:
                                                  const Duration(seconds: 1),
                                              childAnimationBuilder: (widget) =>
                                                  FlipAnimation(
                                                    child: ScaleAnimation(
                                                      child: widget,
                                                    ),
                                                  ),
                                              children: [
                                            Center(
                                              child: CircleAvatar(
                                                radius: 60,
                                                backgroundImage:
                                                    NetworkImage(data['image']),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            rowMethod(
                                                title: 'Booking ID',
                                                desc: data['bookingNo']
                                                    .toString()),
                                            rowMethod(
                                                title: 'Event Name',
                                                desc: data['name']),
                                            rowMethod(
                                                title: 'Buyer Name',
                                                desc: data['userName']),
                                            rowMethod(
                                                title: 'Phone Number',
                                                desc: data['phoneNumber']),
                                            rowMethod(
                                                title: 'Email',
                                                desc: data['email']),
                                            const Text(
                                              'Event Details',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data['desc'],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            rowMethod(
                                                title: 'Event Fee',
                                                desc: '\$${data['fee']}'),
                                            rowMethod(
                                                title: 'Event Date',
                                                desc: data['eventDate']),
                                            rowMethod(
                                                title: 'Event Time',
                                                desc: data['eventTime']),
                                            rowMethod(
                                                title: 'Booking Date',
                                                desc: data['bookDate']),
                                            rowMethod(
                                                title: 'Booking Time',
                                                desc: data['bookTime']),
                                          ]),
                                    ),
                                  ));
                            });
                  } else {
                    return loader;
                  }
                }),
          ),
        ));
  }

  Row rowMethod({required String title, required String desc}) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
