// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:persian_tools/persian_tools.dart';

class Addition extends StatefulWidget {
  const Addition({super.key});

  @override
  State<Addition> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  int questionNum = 1;
  String targetText = '';
  Color color = Colors.grey;
  bool showContainer = true;
  bool showGif = false;
  Random random = Random();

  List<int> numbersList = [];
  List<int> sumList = [];
  Set<int> randomIndex = Set();

  void randomNumber() {
    if (!numbersList.isEmpty) {
      numbersList.clear();
      sumList.clear();
      randomIndex.clear();
    }
    numbersList.add(random.nextInt(50));
    numbersList.add(random.nextInt(50));
    numbersList.add(numbersList[0] + numbersList[1]);

    sumList.add(numbersList[2]);
    sumList.add(random.nextInt(100));
    sumList.add(random.nextInt(100));

    while (randomIndex.length != 3) {
      randomIndex.add(random.nextInt(3));
    }
  }

  void nextQuestion() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (questionNum < 20) {
        setState(() {
          randomNumber();
          questionNum++;
          targetText = '';
          color = Colors.grey;
          showContainer = true;
          showGif = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/icons/btn_back_150.png',
                width: 35, height: 35),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            '$questionNum/20',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF076236)),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/bg_background.webp'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberBox(
                    color: Colors.pink.shade300,
                    number: numbersList[0].toString(),
                  ),
                  Image.asset('assets/icons/ic_add.webp',
                      height: 60, width: 60),
                  NumberBox(
                      color: Colors.green, number: numbersList[1].toString())
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/ic_equal.webp',
                      height: 60, width: 60),
                  DragTarget<Map>(
                    builder: (context, candidateData, rejectedData) {
                      return NumberBox(
                        color: color,
                        number: targetText,
                      );
                    },
                    onAcceptWithDetails: (details) => setState(() {
                      if (details.data['text'] == numbersList[2].toString()) {
                        color = details.data['color'];
                        targetText = details.data['text'];
                        showContainer = false;
                        showGif = true;
                        nextQuestion();
                      }
                    }),
                    onWillAcceptWithDetails: (details) => true,
                  )
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.purple,
                              'text':
                                  sumList[randomIndex.elementAt(0)].toString()
                            },
                          // data: Colors.purple,
                          feedback: Material(
                              child: NumberBox(
                                  color: Colors.purple,
                                  number: sumList[randomIndex.elementAt(0)]
                                      .toString())),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.purple,
                              number:
                                  sumList[randomIndex.elementAt(0)].toString()))
                      : Container(width: 60, height: 60),
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.red,
                              'text':
                                  sumList[randomIndex.elementAt(1)].toString()
                            },
                          // data: Colors.red,
                          feedback: Material(
                              child: NumberBox(
                            color: Colors.red,
                            number:
                                sumList[randomIndex.elementAt(1)].toString(),
                          )),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.red,
                              number:
                                  sumList[randomIndex.elementAt(1)].toString()))
                      : Container(width: 60, height: 60),
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.blue,
                              'text':
                                  sumList[randomIndex.elementAt(2)].toString()
                            },
                          // data: Colors.blue,
                          feedback: Material(
                              child: NumberBox(
                            color: Colors.blue,
                            number:
                                sumList[randomIndex.elementAt(2)].toString(),
                          )),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.blue,
                              number:
                                  sumList[randomIndex.elementAt(2)].toString()))
                      : Container(width: 60, height: 60),
                ],
              ),
              showGif
                  ? Gif(
                      // duration: Duration(seconds: 2),
                      fps: 50,
                      autostart: Autostart.once,
                      image: AssetImage(
                        'assets/drag20assets/animation/animation_right.gif',
                      ),
                      width: 200,
                      height: 200,
                    )
                  : SizedBox()
            ],
          ),
        ));
  }
}

class NumberBox extends StatelessWidget {
  const NumberBox({super.key, this.color, this.number});
  final Color? color;
  final String? number;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
          color: color),
      child: number != null
          ? Center(
              child: Text(
              convertEnToFa(number!),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'scheherazade'),
            ))
          : SizedBox(),
    );
  }
}

class Subtraction extends StatefulWidget {
  const Subtraction({super.key});

  @override
  State<Subtraction> createState() => _SubtractionState();
}

class _SubtractionState extends State<Subtraction> {
  int questionNum = 1;
  String targetText = '';
  Color color = Colors.grey;
  bool showContainer = true;
  bool showGif = false;
  Random random = Random();
  List<int> numbersList = [];
  List<int> sumList = [];
  Set<int> randomIndex = Set();

  void randomNumber() {
    if (!numbersList.isEmpty) {
      numbersList.clear();
      sumList.clear();
      randomIndex.clear();
    }
    numbersList.add(random.nextInt(50));
    numbersList.add(random.nextInt(50));
    numbersList.add(numbersList[0] - numbersList[1]);

    sumList.add(numbersList[2]);
    sumList.add(random.nextInt(100));
    sumList.add(random.nextInt(100));

    while (randomIndex.length != 3) {
      randomIndex.add(random.nextInt(3));
    }
  }

  void nextQuestion() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (questionNum < 20) {
        setState(() {
          randomNumber();
          questionNum++;
          targetText = '';
          color = Colors.grey;
          showContainer = true;
          showGif = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/icons/btn_back_150.png',
                width: 35, height: 35),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            '$questionNum/20',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF076236)),
          ),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/bg_background.webp'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberBox(
                    color: Colors.pink.shade300,
                    number: numbersList[0].toString(),
                  ),
                  Image.asset('assets/icons/ic_minus.webp',
                      height: 60, width: 60),
                  NumberBox(
                      color: Colors.green, number: numbersList[1].toString())
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/ic_equal.webp',
                      height: 60, width: 60),
                  DragTarget<Map>(
                    builder: (context, candidateData, rejectedData) {
                      return NumberBox(
                        color: color,
                        number: targetText,
                      );
                    },
                    onAcceptWithDetails: (details) => setState(() {
                      if (details.data['text'] == numbersList[2].toString()) {
                        color = details.data['color'];
                        targetText = details.data['text'];
                        showContainer = false;
                        showGif = true;
                        nextQuestion();
                      }
                    }),
                    onWillAcceptWithDetails: (details) => true,
                  )
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.purple,
                              'text':
                                  sumList[randomIndex.elementAt(0)].toString()
                            },
                          // data: Colors.purple,
                          feedback: Material(
                              child: NumberBox(
                                  color: Colors.purple,
                                  number: sumList[randomIndex.elementAt(0)]
                                      .toString())),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.purple,
                              number:
                                  sumList[randomIndex.elementAt(0)].toString()))
                      : Container(width: 60, height: 60),
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.red,
                              'text':
                                  sumList[randomIndex.elementAt(1)].toString()
                            },
                          // data: Colors.red,
                          feedback: Material(
                              child: NumberBox(
                            color: Colors.red,
                            number:
                                sumList[randomIndex.elementAt(1)].toString(),
                          )),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.red,
                              number:
                                  sumList[randomIndex.elementAt(1)].toString()))
                      : Container(width: 60, height: 60),
                  showContainer == true
                      ? Draggable<Map>(
                          data: {
                              'color': Colors.blue,
                              'text':
                                  sumList[randomIndex.elementAt(2)].toString()
                            },
                          // data: Colors.blue,
                          feedback: Material(
                              child: NumberBox(
                            color: Colors.blue,
                            number:
                                sumList[randomIndex.elementAt(2)].toString(),
                          )),
                          childWhenDragging: Container(height: 60, width: 60),
                          child: NumberBox(
                              color: Colors.blue,
                              number:
                                  sumList[randomIndex.elementAt(2)].toString()))
                      : Container(width: 60, height: 60),
                ],
              ),
              showGif
                  ? Gif(
                      // duration: Duration(seconds: 2),
                      fps: 50,
                      autostart: Autostart.once,
                      image: AssetImage(
                        'assets/drag20assets/animation/animation_right.gif',
                      ),
                      width: 200,
                      height: 200,
                    )
                  : SizedBox()
            ],
          ),
        ));
  }
}

class Counting extends StatefulWidget {
  const Counting({super.key});

  @override
  State<Counting> createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  int questionNum = 1;
  String targetText = '';
  Color color = Colors.grey;
  bool showContainer = true;
  bool showGif = false;
  Random random = Random();

  var jsonData;
  int? imageNumber;

  Set<int> numbersList = Set();
  Set<int> randomIndex = Set();

  void generateNumber() {
    imageNumber = random.nextInt(30) + 1;
    print(imageNumber);
  }

  void randomNumber() {
    if (numbersList.isNotEmpty) {
      numbersList.clear();
      randomIndex.clear();
    }
    if (numbersList.isEmpty) {
      numbersList.add(imageNumber!);
    }
    while (numbersList.length != 4) {
      numbersList.add(random.nextInt(40));
    }
    while (randomIndex.length != 4) {
      randomIndex.add(random.nextInt(4));
    }
    print('numbersList is $numbersList');
    print('randomIndex is $randomIndex');
  }

  void nextQuestion() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (questionNum < 20) {
        setState(() {
          generateNumber();
          questionNum++;
          targetText = '';
          color = Colors.grey;
          showContainer = true;
          showGif = false;
          randomNumber();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    jsonData = DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/counting.json');
    generateNumber();
    randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/icons/btn_back_150.png',
                width: 35, height: 35),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            '$questionNum/20',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF076236)),
          ),
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder(
            future: jsonData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                var newData = jsonDecode(snapshot.data.toString());
                // generateNumber();
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/background/bg_background.webp'),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                  '${newData[imageNumber! - 1]['img']}'),
                              showGif
                                  ? Gif(
                                      fps: 25,
                                      autostart: Autostart.once,
                                      image: AssetImage(
                                        'assets/drag20assets/animation/animation_success.gif',
                                      ),
                                      width: 200,
                                      height: 200,
                                    )
                                  : SizedBox()
                            ],
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          DragTarget<Map>(
                            builder: (context, candidateData, rejectedData) {
                              return NumberBox(
                                color: color,
                                number: targetText,
                              );
                            },
                            onAcceptWithDetails: (details) => setState(() {
                              if (details.data['text'] ==
                                  numbersList.elementAt(0).toString()) {
                                color = details.data['color'];
                                targetText = details.data['text'];
                                showContainer = false;
                                showGif = true;
                                if (questionNum < 20) {
                                  nextQuestion();
                                }
                              }
                            }),
                            onWillAcceptWithDetails: (details) => true,
                          ),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              showContainer == true
                                  ? Draggable<Map>(
                                      data: {
                                          'color': Colors.purple,
                                          'text': numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(0))
                                              .toString()
                                        },
                                      // data: Colors.purple,
                                      feedback: Material(
                                          child: NumberBox(
                                              color: Colors.purple,
                                              number: numbersList
                                                  .elementAt(
                                                      randomIndex.elementAt(0))
                                                  .toString())),
                                      childWhenDragging:
                                          Container(height: 60, width: 60),
                                      child: NumberBox(
                                          color: Colors.purple,
                                          number: numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(0))
                                              .toString()))
                                  : Container(width: 60, height: 60),
                              showContainer == true
                                  ? Draggable<Map>(
                                      data: {
                                          'color': Colors.red,
                                          'text': numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(1))
                                              .toString()
                                        },
                                      // data: Colors.red,
                                      feedback: Material(
                                          child: NumberBox(
                                        color: Colors.red,
                                        number: numbersList
                                            .elementAt(randomIndex.elementAt(1))
                                            .toString(),
                                      )),
                                      childWhenDragging:
                                          Container(height: 60, width: 60),
                                      child: NumberBox(
                                          color: Colors.red,
                                          number: numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(1))
                                              .toString()))
                                  : Container(width: 60, height: 60),
                              showContainer == true
                                  ? Draggable<Map>(
                                      data: {
                                          'color': Colors.blue,
                                          'text': numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(2))
                                              .toString()
                                        },
                                      // data: Colors.blue,
                                      feedback: Material(
                                          child: NumberBox(
                                        color: Colors.blue,
                                        number: numbersList
                                            .elementAt(randomIndex.elementAt(2))
                                            .toString(),
                                      )),
                                      childWhenDragging:
                                          Container(height: 60, width: 60),
                                      child: NumberBox(
                                          color: Colors.blue,
                                          number: numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(2))
                                              .toString()))
                                  : Container(width: 60, height: 60),
                              showContainer == true
                                  ? Draggable<Map>(
                                      data: {
                                          'color': Colors.green,
                                          'text': numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(3))
                                              .toString()
                                        },
                                      // data: Colors.blue,
                                      feedback: Material(
                                          child: NumberBox(
                                        color: Colors.green,
                                        number: numbersList
                                            .elementAt(randomIndex.elementAt(3))
                                            .toString(),
                                      )),
                                      childWhenDragging:
                                          Container(height: 60, width: 60),
                                      child: NumberBox(
                                          color: Colors.green,
                                          number: numbersList
                                              .elementAt(
                                                  randomIndex.elementAt(3))
                                              .toString()))
                                  : Container(width: 60, height: 60),
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error loading data');
              }
              return CircularProgressIndicator();
            }));
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:persian_tools/persian_tools.dart';

// class Addition extends StatefulWidget {
//   @override
//   _AdditionState createState() => _AdditionState();
// }

// class _AdditionState extends State<Addition> {
//   final FlutterTts flutterTts = FlutterTts();
//   String text = '';

//   Future<void> _speak() async {
//     await flutterTts.setLanguage('fas-IR'); // Set language to Persian (fa-IR)
//     String persianText =
//         convertArToFa(text); // Convert Arabic digits to Persian digits
//     await flutterTts.speak(persianText);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text to Speech'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   text = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Enter text to speak',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 _speak();
//               },
//               child: Text('Speak'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
