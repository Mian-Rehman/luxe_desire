import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:luxe_desires/app/pages/map_details_screen.dart';
import 'package:luxe_desires/app/pages/sub_screen.dart';

import '../constants/app_color.dart';
import '../constants/theme_controller.dart';

class EventDetailsScreen extends StatelessWidget {

  var imageUrl,title,stars;

  EventDetailsScreen(
      this.imageUrl,
      this.title,
      this.stars,
      );

  var eventText = "upcoming event";
  var bottleText = "bottle menu";



  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var color  = !isDark ? LightThemeColor.primary : Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
        backgroundColor: DarkThemeColor.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [


          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 250.r,
            child: Image.network(imageUrl,fit: BoxFit.fitHeight,),
          ),

          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              margin: EdgeInsets.only(top: 20,left: 5),
              child: Text(title,style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
          ),



          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: !isDark
                            ? LightThemeColor.primary
                            : DarkThemeColor.primary,
                        size: 24,
                      ),
                      Text(
                        '$stars Stars',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              InkWell(
                onTap: (){
                  Get.to(MapDetailsScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5,top: 20),
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: !isDark
                            ? LightThemeColor.primary
                            : Colors.white,
                        size: 24,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          'Club map',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  Get.to(SubsScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 5,top: 20),
                  color: Colors.blueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera,
                        color: !isDark
                            ? LightThemeColor.primary
                            : Colors.white,
                        size: 24,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          'gallery',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 5,top: 20),
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share,
                      color: !isDark
                          ? LightThemeColor.primary
                          : Colors.white,
                      size: 24,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        'share',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),

          Visibility(
            visible: false,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eventText.toUpperCase(),style: TextStyle(
                        color: color
                      ),),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(bottleText.toUpperCase())),
                    ],
                  )
                ],
              ),
            ),
          ),




        ],
      ),
    );
  }
}
