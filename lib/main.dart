import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MusicApp(),
     );
   }
 }

 class MusicApp extends StatefulWidget {

   @override
   _MusicAppState createState() => _MusicAppState();
 }

 class _MusicAppState extends State<MusicApp> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         width: double.infinity,
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [
               Colors.black,
               Colors.black87,
             ]
           ),
         ),
         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 60,horizontal: 20),
           child: Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Music Beats",
                   style:TextStyle(
                     color: Colors.blueGrey,
                     fontSize: 35,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Text("List to your Favorite Song",
                   style:TextStyle(
                     color: Colors.blueGrey,
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 SizedBox(
                   height: 25,
                 ),

                 Center(
                   child: Container(
                     width: 250,
                     height: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(60),
                       image: DecorationImage(
                         image: AssetImage("images/music.jpg"),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 18,
                 ),
                 Center(
                   child: Text("Stargazer",
                     style: TextStyle(
                       color: Colors.blueGrey,
                       fontSize: 25,
                     ),
                   ),

                 ),
                 SizedBox(height: 20),
                 Expanded(child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         IconButton(
                           iconSize:45,
                           color: Colors.blue ,
                           onPressed:  (){},
                           icon: Icon(
                             Icons.skip_previous,
                           ),
                         ),
                         IconButton(
                           iconSize:70,
                           color: Colors.blueAccent ,
                           onPressed:  (){},
                           icon: Icon(
                             Icons.play_arrow,
                           ),
                         ),
                         IconButton(
                           iconSize:45,
                           color: Colors.blue ,
                           onPressed:  (){},
                           icon: Icon(
                             Icons.skip_next,
                           ),
                         ),
                       ],

                     ),
                   ],

                 ) ),
               ],
             ),
           ),
         ),

       ),

     );
   }
 }

 