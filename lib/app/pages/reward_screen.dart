import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/modules/home/controllers/home_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants/theme_controller.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  var _qrVisibility = false;
  var _rewardCards = true;
  bool rewardVisibility = false;

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Rewards"),
                centerTitle: true,
                foregroundColor: DarkThemeColor.primaryText,
                backgroundColor: DarkThemeColor.primary,
              ),
              body: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(seconds: 1),
                  childAnimationBuilder: (widget) => FlipAnimation(
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Visibility(
                      visible: _rewardCards,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/imgs/authBg.png",
                              width: MediaQuery.sizeOf(context).width,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 30, bottom: 5),
                              child: const Text(
                                "August Flavour of the \nMonth Reward",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, bottom: 20),
                                  child: const Text(
                                    "Expire 31/08/2023",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _qrVisibility = true;
                                        _rewardCards = false;
                                      });
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      margin: const EdgeInsets.only(
                                          bottom: 10, right: 30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.amber),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: DarkThemeColor.primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    _rewardCards == true
                        ? const SizedBox()
                        : Container(
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () => setState(() {
                                              _qrVisibility = false;
                                              _rewardCards = true;
                                            }),
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                        )),
                                    SizedBox(
                                      width: size.width * .12,
                                    ),
                                    const Text(
                                      "Luxe Desires",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Container(
                                        width: 25,
                                        height: 25,
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Image.asset(
                                            "assets/imgs/Logo.png")),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text("Reward Club",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: DarkThemeColor.primary)),
                                Stack(
                                  children: [
                                    _qrVisibility == true
                                        ? Visibility(
                                            visible: _qrVisibility,
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: Container(
                                                color: Colors.white,
                                                margin: const EdgeInsets.only(
                                                    top: 30),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: QrImageView(
                                                  data:
                                                      'Name: ${controller.name}\nEmail: ${controller.email}\nPhone Number: ${controller.phoneNumber}\nReward: ${controller.reward}',
                                                  version: QrVersions.auto,
                                                  size: 200.0,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Visibility(
                                            visible: rewardVisibility,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * .15),
                                              child: Center(
                                                child: Text(
                                                  'Your Reward\n\$${controller.reward.toStringAsFixed(2)}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: DarkThemeColor
                                                          .primary,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            )),
                                    Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Container(
                                        width: 1,
                                        margin: const EdgeInsets.only(
                                            top: 70, right: 40),
                                        child: Text(
                                          controller.phoneNumber,
                                          style: const TextStyle(fontSize: 9),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text("Scan every purchase for rewards"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _qrVisibility = false;
                                      // _rewardCards = true;
                                      rewardVisibility = true;
                                    });
                                  },
                                  child: const Text(
                                    "Flip me to reveal your rewards",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ));
        });
  }
}
