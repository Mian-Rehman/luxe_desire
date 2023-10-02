import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/constants/contants.dart';
import 'package:luxe_desires/app/widgets/container_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  var _qrVisibility = false;
  var _rewardCards = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards"),
        centerTitle: true,
        foregroundColor: DarkThemeColor.primaryText,
        backgroundColor: DarkThemeColor.primary,
      ),
      body: Column(
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
                    margin: const EdgeInsets.only(left: 20, top: 30, bottom: 5),
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
                        margin: const EdgeInsets.only(left: 20, bottom: 20),
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
                            margin:
                                const EdgeInsets.only(bottom: 10, right: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
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
          Visibility(
            visible: _qrVisibility,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                          child: Image.asset("assets/imgs/Logo.png")),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text("Reward Club",
                      style: TextStyle(
                          fontSize: 12, color: DarkThemeColor.primary)),
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(10),
                          child: QrImageView(
                            data: '1234567890',
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          width: 1,
                          margin: const EdgeInsets.only(top: 70, right: 40),
                          child: const Text(
                            "2763762576",
                            style: TextStyle(fontSize: 9),
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
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _qrVisibility = false;
                        _rewardCards = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Text(
                        "Michelle",
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
