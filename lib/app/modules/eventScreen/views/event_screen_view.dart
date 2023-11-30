import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    final EventScreenController eventController =
        Get.put(EventScreenController());
    final isDark = themeController.isDark.value;
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return GetBuilder<HomeController>(
              init: HomeController(),
              builder: (snapshot) {
                return Bounce(
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
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: size.width,
                    height: size.height * .4,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(10.h),
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(event['image']),
                            fit: BoxFit.fill),
                        color: !isDark
                            ? LightThemeColor.secondaryBackground
                            : DarkThemeColor.secondaryBackground,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () =>
                                eventController.getDate(context: context),
                            child: Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    eventController.selectedDate.value.day
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    DateFormat.MMMM().format(
                                        eventController.selectedDate.value),
                                    style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          event['name'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          event['desc'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$${event['fee']}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          event['date'],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          event['time'],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                        )
                      ],
                    ),
                  ),
                );
              });
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
