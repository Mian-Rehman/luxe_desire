// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../constants/app_color.dart';
// import '../../../constants/contants.dart';
// import '../../../widgets/submit_button.dart';
// import '../controllers/authpage_controller.dart';

// class OTPScreen extends StatelessWidget {
//   const OTPScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final focusNode = FocusNode();
//     final formKey = GlobalKey<FormState>();
//     const focusedBorderColor = Colors.green;
//     const fillColor = Colors.white;

//     final defaultPinTheme = PinTheme(
//       width: 50,
//       height: 50,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(100),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(-2, 2),
//                 blurRadius: 5,
//                 color: Colors.grey.withOpacity(.5))
//           ]),
//     );

//     return GetBuilder<AuthController>(
//         init: AuthController(),
//         builder: (snapshot) {
//           return Scaffold(
//             body: SafeArea(
//                 child: Form(
//               key: formKey,
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(10.0),
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: size.height * .1,
//                     ),
//                     Image.asset(
//                       'assets/imgs/verify.jpg',
//                       width: 200,
//                       height: 200,
//                     ),
//                     const Text(
//                       'We sent the verification code to\nYour Provided Email',
//                       style: TextStyle(
//                         fontSize: 28,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * .03,
//                     ),
//                     Pinput(
//                       controller: snapshot.otpController,
//                       focusNode: focusNode,
//                       androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
//                       listenForMultipleSmsOnAndroid: true,
//                       defaultPinTheme: defaultPinTheme,
//                       validator: (value) {
//                         return value == snapshot.otpController.text
//                             ? null
//                             : 'incorrect Pin';
//                       },
//                       onClipboardFound: (value) {
//                         debugPrint('onClipboardFound: $value');
//                         snapshot.otpController.setText(value);
//                       },
//                       hapticFeedbackType: HapticFeedbackType.lightImpact,
//                       onCompleted: (pin) => snapshot.verifyOTP(),
//                       onChanged: (value) => debugPrint('onChanged: $value'),
//                       cursor: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 9),
//                             width: 22,
//                             height: 1,
//                             color: focusedBorderColor,
//                           ),
//                         ],
//                       ),
//                       focusedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: focusedBorderColor),
//                         ),
//                       ),
//                       submittedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           color: fillColor,
//                           borderRadius: BorderRadius.circular(100),
//                           border: Border.all(color: focusedBorderColor),
//                         ),
//                       ),
//                       length: 6,
//                       onSubmitted: (value) => snapshot.verifyOTP(),
//                       errorPinTheme: defaultPinTheme.copyBorderWith(
//                         border: Border.all(color: Colors.redAccent),
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * .02,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         const Text(
//                           "Didn't receive code?",
//                           style: TextStyle(color: Colors.blueGrey),
//                         ),
//                         SubmitButton(
//                           title: 'Resend OTP',
//                           onTap: () => snapshot.otp(),
//                           width: size.width.w,
//                           height: 40.h,
//                           textColor: DarkThemeColor.primary,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: size.height * .09,
//                     ),
//                     SubmitButton(
//                       title: 'Verify',
//                       onTap: () {
//                         if (snapshot.otpController.text.isNotEmpty) {
//                           focusNode.unfocus();
//                           formKey.currentState!.validate();
//                           snapshot.verifyOTP();
//                         }
//                       },
//                       width: 230.w,
//                       height: 50.h,
//                       textColor: DarkThemeColor.primaryText,
//                       bgColor: DarkThemeColor.primary,
//                     )
//                   ],
//                 ),
//               ),
//             )),
//           );
//         });
//   }
// }
