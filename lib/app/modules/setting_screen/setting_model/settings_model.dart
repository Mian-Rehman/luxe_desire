import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/constants/firebase.dart';
import 'package:luxe_desires/app/modules/authpage/views/authpage_view.dart';
import 'package:luxe_desires/app/modules/editprofile/views/editprofile_view.dart';
import 'package:luxe_desires/app/modules/help_and_support/view/help_and_support.dart';
import 'package:luxe_desires/app/modules/order/views/order_view.dart';
import 'package:luxe_desires/app/modules/userprofile/views/userprofile_view.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingModel {
  final String text;
  final Function() press;
  final IconData icon;
  SettingModel({required this.icon, required this.text, required this.press});
}

List<SettingModel> settingsList = [
  SettingModel(
      icon: Icons.person,
      text: 'Profile',
      press: () => Get.to(() => const EditprofileView())),
  SettingModel(
      icon: Icons.settings,
      text: 'App Settings',
      press: () => Get.to(() => const UserprofileView())),
  SettingModel(
      icon: Icons.dock,
      text: 'Orders',
      press: () {
        Get.to(() => const OrderView());
      }),
  SettingModel(
      icon: Icons.info,
      text: 'Help and Support',
      press: () => Get.to(() => const HelpAndSupport())),
  SettingModel(
    icon: Icons.privacy_tip,
    text: 'Terms and Conditions',
    press: () async => await launchUrl(Uri.parse('https://luxedesiresent.com')),
  ),
  SettingModel(
    icon: Icons.emergency_sharp,
    text: 'Emergency',
    press: () => showBox(
        title: 'Alert!',
        confirmText: 'Emergency Call',
        desc:
            'In case of an emergency click on Emergency Call below to be connected with Emergency Services',
        confirm: () async {
          Get.back();
          final Uri launchUri = Uri(
            scheme: 'tel',
            path: '000',
          );
          if (await canLaunchUrl(launchUri)) {
            await launchUrl(launchUri);
          } else {
            debugPrint('Can not launch URL');
          }
        }),
  ),
  SettingModel(
    icon: Icons.logout,
    text: 'Log Out',
    press: () => showBox(
        title: 'Alert!',
        confirmText: 'Log Out',
        desc:
            'Please confirm you wish to log out of your account by clicking log out below',
        confirm: () async {
          await auth.signOut();
          Get.offAll(() => const AuthpageView());
        }),
  ),
];
