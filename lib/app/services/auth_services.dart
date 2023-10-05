import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:luxe_desires/app/modules/authpage/controllers/authpage_controller.dart';
import '../constants/app_color.dart';
import '../constants/contants.dart';
import '../constants/firebase.dart';

class AuthServices {
  // create account
  signUp(
      {required String email,
      required String password,
      required String dbName,
      required BuildContext context,
      required Map<String, dynamic> map}) async {
    if (GetUtils.isEmail(email)) {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await auth.signInWithEmailAndPassword(email: email, password: password);
        Future.delayed(const Duration(seconds: 4), () async {
          if (auth.currentUser != null) {
            await firestore.collection(dbName).doc(email).set(map);
            // toast(
            //     message: 'Account created successfully!',
            //     color: Colors.green,
            //     title: '🥳 Successfully!');
          }
        });
      } catch (e) {
        errorMessage(e);
      }
    } else {
      toast(
          message: 'Please enter a valid Email',
          color: DarkThemeColor.primary,
          title: 'Alert!');
    }
  }

// login
  login({
    required String email,
    required String password,
  }) async {
    if (GetUtils.isEmail(email)) {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        Get.offAll(const BottomNavBar());
        // controller.sendEmail();
      } catch (e) {
        errorMessage(e);
      }
    } else {
      toast(
          message: 'Please enter a valid Email',
          color: DarkThemeColor.primary,
          title: 'Alert!');
    }
  }

// forget password
  forgetPasscode({required String email}) async {
    if (GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
      } catch (e) {
        errorMessage(e);
      }
    } else {
      toast(
          message: 'Please enter a valid Email',
          color: DarkThemeColor.primary,
          title: 'Alert!');
    }
  }
}

// logout
signOut() async {
  try {
    await auth.signOut();
  } on FirebaseAuthException catch (e) {
    errorMessage(e);
  }
}

// store user in db
createUser({required String dbName, required Map<String, dynamic> map}) async {
  await firestore.collection(dbName).add(map);
}

errorMessage(e) {
  switch (e.code) {
    case 'user-not-found':
      toast(
          message: '😔 No user found for that email',
          color: Colors.red,
          title: '⚠ Warning!');
    case 'weak-password':
      toast(
          message: '🫣 The provided password is too weak!',
          color: Colors.red,
          title: '⚠ Warning!');
    case 'email-already-in-use':
      toast(
          message: '📧 The account already exist for that email!',
          color: Colors.red,
          title: '⚠ Warning!');
    case 'wrong-password':
      toast(
          message: '🔑 Please enter a valid password!',
          color: Colors.red,
          title: '⚠ Warning!');

    default:
      toast(message: '😔 ${e.message}', color: Colors.red, title: '⚠ Warning!');
  }
}
