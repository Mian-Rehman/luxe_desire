import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/eventScreen/controllers/event_screen_controller.dart';
import 'package:luxe_desires/app/modules/home/controllers/home_controller.dart';
import 'package:luxe_desires/app/payment_integration/payment_integration.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen(
      {Key? key,
      required this.bookingId,
      required this.userName,
      required this.email,
      required this.number,
      required this.eventName,
      required this.image,
      required this.desc,
      required this.date,
      required this.time,
      required this.fee})
      : super(key: key);
  final String bookingId,
      userName,
      email,
      number,
      eventName,
      image,
      desc,
      date,
      time,
      fee;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Tickets & Booking"),
                centerTitle: true,
                backgroundColor: DarkThemeColor.primary,
                foregroundColor: Colors.white,
              ),
              body: Column(children: [
                Container(
                    width: size.width,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              DarkThemeColor.primary,
                              DarkThemeColor.primary
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(seconds: 1),
                        childAnimationBuilder: (widget) => FlipAnimation(
                          child: ScaleAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            child: QrImageView(
                              data: 'Booking ID#\n$bookingId.toString()}',
                              version: QrVersions.auto,
                              size: 180.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.white54, width: 2)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "ID",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                      bookingId.toString(),
                                      style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  color: Colors.white54,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      eventName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text('$date $time'),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "TOTAL",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white54),
                          ),
                          const SizedBox(
                            height: 1.5,
                          ),
                          Text(
                            '\$$fee',
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<HomeController>(
                              init: HomeController(),
                              builder: (snapshot) {
                                return TextButton(
                                  onPressed: () {
                                    PaymentAPI().makePayment(
                                        payment: fee,
                                        id: bookingId,
                                        userName: userName,
                                        eventName: eventName,
                                        decs: desc,
                                        image: image,
                                        email: email,
                                        number: number,
                                        fee: fee,
                                        date: date,
                                        time: time,
                                        context: context,
                                        reward: snapshot.reward + 0.20);
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: const Center(
                                        child: Text(
                                      "Done",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ))
              ]));
        });
  }
}
