import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/app_color.dart';

class SongsPlayListScreen extends StatefulWidget {
  const SongsPlayListScreen({Key? key}) : super(key: key);

  @override
  State<SongsPlayListScreen> createState() => _SongsPlayListScreenState();
}

class _SongsPlayListScreenState extends State<SongsPlayListScreen> {

  var activeBarColor = Colors.white;
  var unActiveColor = Colors.grey;

  var songColor = Colors.white;
  var playlistColor = Colors.white38;
  var artistColor = Colors.white38;
  var albumColor = Colors.white38;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Playlists"),
        backgroundColor: DarkThemeColor.primary,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: (){
                        setState(() {

                          songColor = Colors.white;
                          playlistColor = Colors.white38;
                          artistColor = Colors.white38;
                          albumColor = Colors.white38;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: songColor,
                                  width: 2
                                )
                            )
                        ),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text("Songs",style: TextStyle(
                            fontSize: 18
                          ),),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          songColor = Colors.white38;
                          playlistColor = Colors.white;
                          artistColor = Colors.white38;
                          albumColor = Colors.white38;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: playlistColor,
                              width: 2
                            )
                          )
                        ),

                        child:Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text("Playlists",style: TextStyle(
                              fontSize: 18
                          ),),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          songColor = Colors.white38;
                          playlistColor = Colors.white38;
                          artistColor = Colors.white;
                          albumColor = Colors.white38;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: artistColor,
                                  width: 2
                                )
                            )
                        ),
                        child:Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text("Artists",style: TextStyle(
                              fontSize: 18
                          ),),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        setState(() {
                          songColor = Colors.white38;
                          playlistColor = Colors.white38;
                          artistColor = Colors.white38;
                          albumColor = Colors.white;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: albumColor,
                                  width: 2
                                )
                            )
                        ),
                        child:Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text("Album",style: TextStyle(
                              fontSize: 18
                          ),),
                        ),
                      ),
                    ),


                  ],
                ),
              ),


              Container(
                height: MediaQuery.sizeOf(context).height /1.2,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemBuilder: (context,index){
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
                                child: Card(
                                  child: Image.network(
                                   "https://images.unsplash.com/photo-1525824236856-8c0a31dfe3be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2F0ZXJmYWxsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                                    width: 100,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )),

                            Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("To emo aqa delo ",style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    ),
                                    SizedBox(height: 4,),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("To emo aqa delo ",style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      ),
                                    ),

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
                                          Card(
                                            color: Colors.black26,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                child: Center(
                                                  child: Text(
                                                    "1",style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white
                                                  ),
                                                  ),
                                                ),
                                              ),
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
                  itemCount: 16,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
