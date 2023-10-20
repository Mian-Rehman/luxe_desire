import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
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

  makePayment({required String payment}) async {
    try {
      paymnetIntent = await createPaymentIntent(payment: payment);
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
