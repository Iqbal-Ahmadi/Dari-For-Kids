// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/next_prevButton.dart';
import 'package:audioplayers/audioplayers.dart';

class LessonElement extends StatefulWidget {
  const LessonElement({super.key, this.index, this.jsonfile});
  final int? index;
  final String? jsonfile;

  _LessonElementState createState() => _LessonElementState();
}

class _LessonElementState extends State<LessonElement> {
  int currentIndex = 0;
  var jsonData;
  final player = AudioPlayer();
  bool isplaying = false;

  @override
  void initState() {
    super.initState();
    jsonData = DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/${widget.jsonfile}.json');
    widget.index != null
        ? currentIndex = widget.index!
        : currentIndex = currentIndex;
    // player.onPlayerStateChanged.listen((event) {
    //   setState(() {
    //     isplaying = event == PlayerState.playing;
    //     print(isplaying);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background/bg_view.png'),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Image.asset('assets/icons/btn_back_150.png',
                      width: 50, height: 50),
                  onPressed: () {
                    player.dispose();
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: jsonData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        var newData = jsonDecode(snapshot.data.toString());

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                print(isplaying);
                                if (isplaying) {
                                  player.stop();
                                  // player.dispose();
                                }

                                player.play(AssetSource(newData[currentIndex]['audio'].toString()));
                              },
                              child: Image.asset(
                                'assets/icons/btn_sound.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  newData[currentIndex]['img'],
                                  width: 200,
                                  height: 200,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    NextAndPrevButton(
                                      onpress: () {
                                        setState(() {
                                          if (currentIndex > 0) {
                                            currentIndex--;
                                          }
                                        });
                                      },
                                      image: 'assets/icons/btn_prev_150.png',
                                    ),
                                    NextAndPrevButton(
                                      onpress: () {
                                        setState(() {
                                          if (currentIndex <
                                              newData.length - 1) {
                                            currentIndex++;
                                          }
                                        });
                                      },
                                      image: 'assets/icons/btn_next_150.png',
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              newData[currentIndex]['name'],
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Digi koodak'),
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error loading data');
                      }
                      return CircularProgressIndicator();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
