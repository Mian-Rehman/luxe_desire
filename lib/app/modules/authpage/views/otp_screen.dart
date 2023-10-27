import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../constants/app_color.dart';
import '../../../constants/contants.dart';
import '../../../widgets/submit_button.dart';
import '../controllers/authpage_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final formKey = GlobalKey<FormState>();
    const focusedBorderColor = Colors.green;
    const fillColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                offset: const Offset(-2, 2),
                blurRadius: 5,
                color: Colors.grey.withOpacity(.5))
          ]),
    );

    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (snapshot) {
          return Scaffold(
            body: SafeArea(
                child: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .1,
                    ),
                    Image.asset(
                      'assets/imgs/verify.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: size.height * .04,
                    ),
                    Text(
                      'We sent the verification code to\nYour $email',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Pinput(
                      controller: snapshot.otpController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      validator: (value) {
                        return value == otp.toString() ? null : 'incorrect Pin';
                      },
                      onClipboardFound: (value) {
                        debugPrint('onClipboardFound: $value');
                        snapshot.otpController.setText(value);
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) => snapshot.verifyOTP(otpValue: pin),
                      onChanged: (value) => debugPrint('onChanged: $value'),
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      length: 6,
                      onSubmitted: (value) =>
                          snapshot.verifyOTP(otpValue: value),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Didn't receive code?",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        TextButton(
                          child: const Text('Resend OTP'),
                          onPressed: () => snapshot.sendEmail(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .09,
                    ),
                    SubmitButton(
                      title: 'Verify',
                      onTap: () {
                        if (snapshot.otpController.text.isNotEmpty) {
                          focusNode.unfocus();
                          formKey.currentState!.validate();
                          snapshot.verifyOTP(
                              otpValue: snapshot.otpController.text);
                        }
                      },
                      width: 230.w,
                      height: 50.h,
                      textColor: DarkThemeColor.primaryText,
                      bgColor: DarkThemeColor.primary,
                    )
                  ],
                ),
              ),
            )),
          );
        });
  }
}
