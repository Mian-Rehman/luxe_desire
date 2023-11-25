import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:luxe_desires/app/modules/eventScreen/controllers/event_screen_controller.dart';
import 'package:luxe_desires/app/payment_integration/keys.dart';

class PaymentAPI {
  Map<String, dynamic>? paymnetIntent;

  createPaymentIntent({required String payment}) async {
    try {
      Map<String, dynamic> body = {'amount': payment, 'currency': 'USD'};
      http.Response response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            "Authorization": "Bearer $token",
            "content-Type": "application/x-www-form-urlencoded",
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  makePayment(
      {required String payment,
      required String id,
      required String email,
      required String number,
      required double reward,
      required String decs,
      required String userName,
      required String eventName,
      required String date,
      required String time,
      required String fee,
      required String image,
      required BuildContext context}) async {
    try {
      paymnetIntent = await createPaymentIntent(payment: '${payment}00');
      // var gPay = const PaymentSheetGooglePay(
      //     merchantCountryCode: 'US', currencyCode: 'USD', testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymnetIntent!['client_secret'],
        style: ThemeMode.dark,
        merchantDisplayName: 'Luxes Desires',
        // googlePay: gPay
      ));
      await showPayment();
      EventScreenController().bookEvent(
          bookingId: id,
          userName: userName,
          phoneNumber: number,
          email: email,
          image: image,
          name: eventName,
          desc: decs,
          date: date,
          fee: fee,
          time: time,
          reward: reward,
          bookDate: DateFormat.yMMMd().format(DateTime.now()),
          bookTime: DateFormat("KK:mm a").format(DateTime.now()));
      // EventScreenController().editEvent(id: id, reward: reward);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
