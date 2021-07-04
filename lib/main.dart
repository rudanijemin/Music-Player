import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:file_picker/file_picker.dart';


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
   bool isPlaying = false; // at the begining we are not playing any song
   IconData playBtn = Icons.play_arrow;//the main state of the play button icon

   //Now let's start by creating our music player
   //first let's declare some object
   AudioPlayer _audioPlayer;
   AudioCache cache;

   Duration position = new Duration();
   Duration musicLength = new Duration();

   //we will create a custom slider

   Widget slider() {
     return Container(
       width: 200.0,
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
     _audioPlayer.seek(newPos);
   }


   //Now let's initialize our player
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     _audioPlayer = AudioPlayer();
     cache = AudioCache(fixedPlayer: _audioPlayer);


     //now let's handle the audioplayer time

     //this function will allow you to get the music duration
     _audioPlayer.durationHandler = (d) {
       setState(() {
         musicLength = d;
       });
     };

     //this function will allow us to move the cursor of the slider while we are playing the song
     _audioPlayer.positionHandler = (p) {
       setState(() {
         position = p;
       });
     };
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
           padding: EdgeInsets.symmetric(vertical: 80,horizontal: 20),
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
                 Container(
                   margin: EdgeInsets.only(top: 50),
                   child: FlatButton(
                     onPressed: () async {
                       _audioPlayer.pause();
                       String filePath = await FilePicker.getFilePath();
                       int status = await _audioPlayer.play(filePath, isLocal: true);
                       if (status == 1) {
                         setState(() {
                           isPlaying = true;
                         });
                       }
                     },
                     child: Image.asset(
                       "images/2.jpg",
                       fit: BoxFit.contain,
                     ),
                   ),
                 ),


                 SizedBox(height: 20),
                 Expanded(child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     //Let's start by adding the controller
                     //let's add the time indicator text
                     Container(
                       width:500.0,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center ,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text(
                             "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                             style: TextStyle(
                               fontSize: 15.0,
                               color: Colors.blueAccent,
                             ),
                           ),
                           slider(),
                           Text(
                             "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                             style: TextStyle(
                               fontSize: 15.0,
                               color: Colors.blueAccent,
                             ),
                           ),
                         ],
                       ),
                     ),


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
                           iconSize: 60,
                           icon: Icon(
                             isPlaying ? Icons.pause : Icons.play_arrow,


                             color: Colors.blueAccent,
                           ),
                           onPressed: () {
                             if (isPlaying) {
                               _audioPlayer.pause();
                               cache.play("filePath, isLocal: true");
                               setState(() {
                                 isPlaying = false;
                               });
                             } else {
                               _audioPlayer.resume();
                               setState(() {
                                 isPlaying = true;
                               });
                             }
                           },
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

