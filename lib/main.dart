import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
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

  //we will need some variables
   bool playing = false; // at the begining we are not playing any song
   IconData playBtn = Icons.play_arrow;//the main state of the play button icon

   //Now let's start by creating our music player
   //first let's declare some object
   AudioPlayer _player;
   AudioCache cache;

   Duration position = new Duration();
   Duration musicLength = new Duration();

   //we will create a custom slider

   Widget slider() {
     return Container(
       width: 300.0,
       child: Slider.adaptive(
           activeColor: Colors.blue[800],
           inactiveColor: Colors.grey[350],
           value: position.inSeconds.toDouble(),
           max: musicLength.inSeconds.toDouble(),
           onChanged: (value) {
             seekToSec(value.toInt());
           }),
     );
   }

   //let's create the seek function that will allow us to go to a certain position of the music
   void seekToSec(int sec) {
     Duration newPos = Duration(seconds: sec);
     _player.seek(newPos);
   }

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
                     slider(),
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
                           onPressed:  (){
                             //here we will add the functionlity of the play button
                             if(!playing){
                               setState(() {
                                 playBtn=Icons.pause;
                                 playing=true;
                               });
                             }
                             else{
                               setState(() {
                                 playBtn=Icons.play_arrow;
                                 playing=false;
                               });
                             }

                           },
                           icon: Icon(
                             playBtn,
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

 