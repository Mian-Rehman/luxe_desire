import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/constants/theme_controller.dart';
import 'package:luxe_desires/app/modules/eventScreen/controllers/event_screen_controller.dart';
import 'package:luxe_desires/app/modules/home/controllers/home_controller.dart';
import 'package:luxe_desires/app/pages/ticket_screen.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';

class EventScreenView extends StatelessWidget {
  EventScreenView({Key? key}) : super(key: key);
  var bookingNo = Random().nextInt(6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text('Events'),
          centerTitle: true,
          backgroundColor: DarkThemeColor.primary,
        ),
        body: StreamBuilder(
            stream: firestore.collection('events').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    return EventCard(
                      event: data,
                      bookingId: bookingNo.toString(),
                    );
                  },
                );
              } else {
                return loader;
              }
            }));
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, required this.bookingId});

  final dynamic event;
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
                color: !isDark
                    ? LightThemeColor.secondaryBackground
                    : DarkThemeColor.secondaryBackground,
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    event['image'],
                    height: size.height * .3.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.event_available,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      event['name'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                eventMethod(context, Icons.calendar_month, event['desc']),
                const SizedBox(
                  height: 5,
                ),
                eventMethod(context, Icons.money, event['fee']),
                const SizedBox(
                  height: 5,
                ),
                eventMethod(context, Icons.calendar_month, event['date']),
                const SizedBox(
                  height: 5,
                ),
                eventMethod(context, Icons.watch, event['time']),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<HomeController>(
                    init: HomeController(),
                    builder: (snapshot) {
                      return Bounce(
                        duration: const Duration(milliseconds: 300),
                        onPressed: () => Get.to(() => TicketScreen(
                              bookingId: bookingId,
                              userName: snapshot.name,
                              number: snapshot.phoneNumber,
                              email: snapshot.email,
                              image: event['image'],
                              eventName: event['name'],
                              desc: event['desc'],
                              date: event['date'],
                              fee: event['fee'],
                              time: event['time'],
                            )),
                        child: ContainerWidget(
                            bgColor: DarkThemeColor.primary,
                            child: const Text('Book Event')),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

  Row eventMethod(BuildContext context, IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
