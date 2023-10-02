import 'package:flutter/material.dart';


class SubsScreen extends StatefulWidget {
  const SubsScreen({Key? key}) : super(key: key);

  @override
  State<SubsScreen> createState() => _SubsScreenState();
}

class _SubsScreenState extends State<SubsScreen> {

  var guestListColor = Colors.transparent;
  var tableServicesColor = Colors.transparent;

  var guestTextColor = Colors.white54;
  var  tableTextColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
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
                     flex: 3,
                     child: Container(
                       width: 50,
                       height: 50,
                       margin: EdgeInsets.only(left: 10,top: 5),
                       child: Row(
                         children: [
                           Icon(Icons.catching_pokemon,color: Colors.white,),
                           Container(
                               margin: EdgeInsets.only(left: 10),
                               child: Text("Luxes Desire",style: TextStyle(fontSize: 21,color: Colors.white),)),
                         ],
                       )
                       ,
                     ),
                   ),

                   Expanded(
                     flex: 2,
                     child: Container(
                       width: 300,
                       height: 50,
                       margin: EdgeInsets.only(left: 10,top: 5),
                     ),
                   ),

                   Expanded(
                     flex: 1,
                     child: Container(
                       width: 50,
                       height: 50,
                       margin: EdgeInsets.only(left: 10,top: 5),
                       child: Visibility(
                           visible: false,
                           child: Icon(Icons.menu,color: Colors.white,))
                       ,
                     ),
                   ),

                 ],
               ),
             ),
           ],
         ),
         
         Container(
           width: MediaQuery.sizeOf(context).width,
           height: 200,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10)
           ),
           child: Image.network("https://static.nike.com/a/images/f_auto,b_rgb:f5f5f5,w_440/cf6886fd-72b6-4a08-a3a8-bb5a92508fd0/air-max-270-mens-shoes-KkLcGR.png"
           ,
             fit: BoxFit.cover,
           ),
         ),

         Container(
           margin: EdgeInsets.all(10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("10:00 AM- 4:00 PM",style: TextStyle(fontSize: 15,color: Colors.amber),),
               SizedBox(width:10,),
               Icon(Icons.share,color: Colors.white,),
               SizedBox(width: 5,),
               Text("share",style: TextStyle(fontSize: 15,color: Colors.white),),
               
             ],
           ),
         ),

         Container(
             margin: EdgeInsets.only(left: 5),
             child: Text("SATURDAYS",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),)),

         SizedBox(height: 20,),
         Container(
             margin: EdgeInsets.only(left: 5),
             child: Text("Description",style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),)),

         SizedBox(height: 20,),
         
         Container(
             margin: EdgeInsets.only(left: 5),
             child: Text("Bottle service by reservation only",style: TextStyle(fontSize: 14,color: Colors.white),)),

         SizedBox(height: 20,),
         Container(
             margin: EdgeInsets.only(left: 5),
             child: Text("Ladies free before 12 AM",style: TextStyle(fontSize: 14,color: Colors.white),)),


         SizedBox(height: 20,),
         Container(
           width: MediaQuery.sizeOf(context).width,
           padding: EdgeInsets.all(2),
           margin: EdgeInsets.only(left: 20,right: 20,top: 30),
           decoration: BoxDecoration(
             border: Border.all(
                 width: 2.0,
               color: Colors.white
             ),
             borderRadius: BorderRadius.all(
                 Radius.circular(25.0) //                 <--- border radius here
             ),
           ),
           child: Stack(
             children: [
               Align(
                 alignment: AlignmentDirectional.topStart,
                 child: InkWell(
                   onTap: (){
                     setState(() {
                       guestListColor = Colors.amber;
                       tableServicesColor = Colors.transparent;
                       guestTextColor = Colors.black;
                       tableTextColor = Colors.white54;
                     });
                   },
                   child: Container(
                     width: MediaQuery.sizeOf(context).width / 2.5,
                     height: 40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: guestListColor
                     ),
                     child: Center(child: Text("Guest List",style: TextStyle(
                       fontSize: 16,
                       color: guestTextColor
                     ),)
                     ),
                   ),
                 ),
               ),
               Align(
                 alignment: AlignmentDirectional.topEnd,
                 child: InkWell(
                   onTap: (){
                     setState(() {
                       guestListColor = Colors.transparent;
                       tableServicesColor = Colors.amber;
                       guestTextColor = Colors.white54;
                       tableTextColor = Colors.black;
                     });
                   },
                   child: Container(
                     width: MediaQuery.sizeOf(context).width / 2.5,
                     height: 40,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: tableServicesColor
                     ),
                     child:Center(child: Text("Table Services",style: TextStyle(
                         fontSize: 16,
                         color: tableTextColor
                     ),)
                     ),
                   ),
                 ),
               )
             ],
           ),
         ),

         SizedBox(height: 30,),
         Container(
             margin: EdgeInsets.only(left: 10),
             child: Text("First Name",style: TextStyle(fontSize: 14,color: Colors.white54),)),

         Container(
           margin: EdgeInsets.only(left: 10,right: 10,top: 10),
           child: TextField(
             decoration: InputDecoration(
               hintText: "",
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                 borderSide: BorderSide(
                   color: Colors.grey,
                   width: 2
                 )
               )
             ),
           ),
         ),

         SizedBox(height: 20,),
         Container(
             margin: EdgeInsets.only(left: 10),
             child: Text("Last Name",style: TextStyle(fontSize: 14,color: Colors.white54),)),

         Container(
           margin: EdgeInsets.only(left: 10,right: 10,top: 10),
           child: TextField(
             decoration: InputDecoration(
                 hintText: "",
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(
                         color: Colors.grey,
                         width: 2
                     )
                 )
             ),
           ),
         )



       ],
      ),
    ),
   );
  }
}
