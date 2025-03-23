// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:preschool_flutter/cards_screens/games_screen.dart';
import 'package:preschool_flutter/cards_screens/learning_screen.dart';
import 'package:preschool_flutter/cards_screens/lessons/games.dart';
import 'package:preschool_flutter/cards_screens/lessons/lessons.dart';
import 'package:preschool_flutter/cards_screens/listen_And_Guess_screen.dart';
import 'package:preschool_flutter/cards_screens/look_And_Choose_screen.dart';
import 'package:preschool_flutter/cards_screens/video_cards.dart';
import 'package:preschool_flutter/setting.dart';
import 'package:preschool_flutter/splash_screen.dart';
import 'package:preschool_flutter/cards_screens/drawing_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      'learning_screen': (context) => ABCScreen(),
      'lesson_screen': (context) => Lessons(),
      'look_and_choose': (context) => LookAndChoose(),
      'listen_and_guess': (context) => ListenAndGuess(),
      'drawing': (context) => Drawing(),
      'games_screen': (context) => Games(),
      'video_cards': (context) => Videos(),
      'addition': (context) => Addition(),
      'counting': (context) => Counting(),
      'subtraction': (context) => Subtraction()
    },
    home: SplashScreen(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _audioPlayer = AudioPlayer();
  void _playBackgroundMusic() async {
    // Specify the path to your audio file
    await _audioPlayer.setSource(AssetSource('sounds/background_music.mp3'));

    // Set the volume to a lower value (e.g., 0.1 for very low volume)
    _audioPlayer.setVolume(0.1);

    // Play the audio and set it to loop
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.resume(); // Start playing the audio
  }

  @override
  Widget build(BuildContext context) {
    _playBackgroundMusic();
    var jsondData =
        DefaultAssetBundle.of(context).loadString('assets/jsonfile/cards.json');
    return Scaffold(
      appBar: AppBar(
        title: Text('Kids Play',
            style: TextStyle(
                color: Color(0xFF1C6232), fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFFFD316),
        actions: [
          IconButton(
              icon: Image.asset('assets/icons/ic_setting.png',
                  width: 35, height: 35),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(),
                    ));
              })
        ],
      ),
      body: FutureBuilder(
          future: jsondData,
          builder: (context, snapshot) {
            var newData = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: newData == null ? 0 : newData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, newData[index]['route']);
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      child: Image.asset(newData[index]['img']),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
