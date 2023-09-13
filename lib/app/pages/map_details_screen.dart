import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app_color.dart';
import '../constants/theme_controller.dart';

class MapDetailsScreen extends StatefulWidget {
  const MapDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MapDetailsScreen> createState() => _MapDetailsScreenState();
}

class _MapDetailsScreenState extends State<MapDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    var color  = !isDark ? LightThemeColor.primary : Colors.white;
    var mapButtonColor = Colors.black26;
    var listButtonColor = Colors.purple;
    var noActiveColor  = Colors.black26;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 80,
              ),
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  margin: EdgeInsets.only(top: 30),

                child: Row(
                  children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(left: 10,top: 5),
                      child: Card(
                          color: Colors.black26,
                          child: Icon(Icons.menu,color: Colors.white,)
                      )
                      ,
                    ),
                  ),

                    Expanded(
                      flex: 4,
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.only(left: 10,top: 5),
                        child:
                        Card(
                            color: Colors.black26,
                            child: Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 10,left: 10),
                                      child: Icon(Icons.search,color: Colors.white,)
                                  ),
                                  Container(
                                    alignment: AlignmentDirectional.center,
                                      margin: EdgeInsets.only(top: 1),
                                      child: Text("Venus..")
                                  ),
                                ]
                            )
                        )
                        ,
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(left: 10,top: 5),
                        child: Card(
                            color: Colors.black26,
                            child: Icon(Icons.set_meal,color: Colors.white,)
                        )
                        ,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: (){
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.only(left: 20,top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mapButtonColor,
                    ),
                    child: Center(child: Text("Map")),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.only(right: 20,top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: listButtonColor,
                  ),
                  child: Center(child: Text("list")),
                ),
              )
            ],
          ),

          Container(
            height: MediaQuery.sizeOf(context).height /1.4,
            padding: EdgeInsets.all(10),
            child: ListView.separated(itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.black26,
                          child: Icon(Icons.hourglass_top,color: Colors.white,),
                        )),

                    Expanded(
                      flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("To emo aqa delo ",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                            SizedBox(height: 4,),
                            Text("To emo aqa delo ",style: TextStyle(
                                fontSize: 12,

                            ),
                            ),

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      )
                          ],
                        )),

                     Expanded(
                      flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Text(
                                    '1.5 miles',
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              );
            },
              itemCount: 6,
              separatorBuilder: (context,index){
              return Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Divider(height: 10,thickness: 5));
              },
            ),
          )



        ],



      ),
    );
  }
}
