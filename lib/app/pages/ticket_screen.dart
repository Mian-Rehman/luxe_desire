import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxe_desires/app/constants/app_color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tickets"),
        centerTitle: true,
        backgroundColor: DarkThemeColor.primary,
      ),
      body: SingleChildScrollView(
        child: Visibility(
          visible: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.orange,
                  Colors.red
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                  margin:EdgeInsets.only(top: 20),
                  child: Text("Booking")),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.all(10),
                  child:
                  QrImageView(
                    data: '1289726e70',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white54,
                      width: 2
                    )
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("A D M I T"),
                          Text("1",style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          ),
                          )
                        ],
                      ),

                      SizedBox(width: 20,),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.white54,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Luxe Desire",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          Text("Fost Quee Entity",style: TextStyle(
                              fontSize: 13,

                          ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Stack(
                    children: [
                      Container(
                        child: Text("John Mehave 01/11/2023"),
                      ),

                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Container(
                          child: Text("view all"),
                        ),
                      )
                    ],
                  ),
                ),


                SizedBox(height: 30,),
                Container(
                  child: Text("TOTAL",style: TextStyle(
                    fontSize: 18,
                    color: Colors.white54
                  ),),

                ),

                SizedBox(height: 1.5,),
                Container(
                  child: Text("\$169",style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),

                ),

                SizedBox(height: 10,),
                Text("We recommended to causal dress code"),
                Text("We recommended to causal dress code"),
                Text("We recommended to causal dress code"),

                SizedBox(height: 20,),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Center(child: Text("Done",style: TextStyle(
                    color: Colors.black
                  ),)),
                ),
                
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Share with friend")
                  ],
                ),
                SizedBox(height: 10,),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
