import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:luxe_desires/app/modules/home/views/widgets/popular_widget.dart';
import 'package:luxe_desires/app/pages/play_list.dart';
import 'package:luxe_desires/app/pages/sub_screen.dart';
import 'package:luxe_desires/app/routes/app_pages.dart';

import '../../../constants/theme_controller.dart';
import '../controllers/musiclist_controller.dart';

class MusiclistView extends GetView<MusiclistController> {
  const MusiclistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as bool?;
    final isAdmin = args ?? false;
    final ThemeController themeController = Get.find();
    final isDark = themeController.isDark.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkThemeColor.primary,
        title: Text(
          'Music Streaming',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Readex Pro',
                color: DarkThemeColor.alternate,
                fontSize: 19.sp,
              ),
        ),
        actions: [
          if (isAdmin)
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ADD_MUSIC);
              },
              icon: Icon(
                Icons.add,
                color: DarkThemeColor.alternate,
              ),
            )
        ],
        centerTitle: false,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Text("Recently played",style: TextStyle(fontSize: 19),),
            ),

            Container(
              height: 250.w,
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index){
                   return Container(
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.only(left: 5,right: 5),
                     decoration: BoxDecoration(
                       color: !isDark ? LightThemeColor.primary
                           : Colors.transparent,
                       boxShadow: const [
                         BoxShadow(
                           blurRadius: 4,
                           color: Color(0x520E151B),
                           offset: Offset(0, 2),
                         )
                       ],
                       borderRadius: BorderRadius.circular(8),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(6),
                           child: Image.network(
                             'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png',
                             width: 180.w,
                             height: 150.h,
                             fit: BoxFit.cover,
                           ),
                         ),
                         SizedBox(height: 8,),
                         Text(
                           'Jamies',
                           style: Theme.of(context).textTheme.bodyLarge,
                         ),
                         Padding(
                           padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                           child: Text(
                             '[rock music]',
                             style: Theme.of(context).textTheme.labelMedium,
                           ),
                         ),
                       ],
                     ),
                   );
              }),
            ),

            Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Text("Your Favorite Artist",style: TextStyle(fontSize: 17),),
            ),

            Container(
              height: 120.w,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 5,right: 5),

                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x520E151B),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black26,
                            backgroundImage: NetworkImage("https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png"),
                            // child: Image.network(
                            //   'https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png',
                            //   width: 180.w,
                            //   height: 150.h,
                            //   fit: BoxFit.cover,
                            // ),
                          ),

                          SizedBox(height: 8,),
                          Text(
                            'Jamies',
                            style: TextStyle(
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

            Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Stack(
                children: [
                  Text("Songs",style: TextStyle(fontSize: 17),),
                  InkWell(
                    onTap: (){
                    Get.to(SongsPlayListScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Text("View all",style: TextStyle(fontSize: 17),)),
                    ),
                  ),
                ],
              ),
            ),


            ListView.builder(
                padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, listViewIndex) {
                  return const PopularWidget();
                }),
          ],
        ),
      )




    );
  }
}
