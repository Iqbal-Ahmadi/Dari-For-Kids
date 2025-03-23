// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/appbar.dart';
import 'dart:math';

import 'package:preschool_flutter/widgets/next_prevButton.dart';

class Look extends StatefulWidget {
  Look({required this.Jsonfile});
  final String? Jsonfile;
  @override
  _lookState createState() => _lookState();
}

class _lookState extends State<Look> {
  Random random = Random();
  var jsonData;
  List<String> list = [];

  Set<int> setOfInts = Set();
  Set<int> setOfIndex = Set();
  int currentIndex = 0;
  int? jsonLength;
  bool nameListState = false;
  int condition = 0;

  Color green = Color(0xFF4CB151);
  Color red = Color(0xFFF44337);
  Color lightblue = Color(0xFFCCFDFE);
  List<Color> colorList = [
    Color(0xFFCCFDFE),
    Color(0xFFCCFDFE),
    Color(0xFFCCFDFE),
    Color(0xFFCCFDFE)
  ];

  // void loadJsonAsset() async {
  //   final String jsonString =
  //       await rootBundle.loadString('assets/jsonfile/seasons.json');
  //   final data = jsonDecode(jsonString);
  //   setState(() {
  //     jsonData = data;
  //     print(jsonData.length);
  //     print(jsonData);
  //   });
  // }

  // void loop() {
  //   if (setOfInts.length == 4) {
  //     setOfInts.clear();
  //     // setOfIndex.clear();
  //   }
  //   setOfInts.add(currentIndex);
  //   while (setOfInts.length != 4) {
  //     setOfInts.add(random.nextInt(jsonLength == null ? 1 : jsonLength!));
  //   }
  // }
  void changeColor(int index) {
    setState(() {
      if (setOfInts.elementAt(setOfIndex.elementAt(index)) == currentIndex) {
        colorList[index] = green;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Correct Answer')),
        );
      } else {
        colorList[index] = red;
      }
      nameListState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    jsonData = DefaultAssetBundle.of(context)
        .loadString('assets/jsonfile/${widget.Jsonfile}.json');
  }

  // Future<String> loadJsonData() async {
  //   return await rootBundle.loadString('assets/jsonfile/alphabet.json');
  // }

  // Future loadData() async {
  //   String jsonString = await loadJsonData();
  //   final jsonData = json.decode(jsonString);
  //   setState(() {
  //     data = Data.fromJson(jsonData);
  //   });
  // }

  // void changeData() {
  //   setState(() {
  //     // Change the image and image names randomly
  //     // Replace this logic with your actual implementation
  //     data.imageName = "new_image.jpg";
  //     data.imageNames = ["new_image.jpg", "another_image.jpg", "third_image.jpg"];
  //   });
  // }

  // void checkAnswer(String selectedImageName) {
  //   if (selectedImageName == data.imageName) {
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text('Correct Answer')),
  // );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('False Answer')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Appbar(title: widget.Jsonfile, onpress: () => Navigator.pop(context)),
      body: FutureBuilder(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            var newData = jsonDecode(snapshot.data.toString());
            if (setOfInts.length == 4 && nameListState == false) {
              setOfInts.clear();
              setOfIndex.clear();
            }
            if (nameListState == false) {
              setOfInts.add(currentIndex);
            }
            while (setOfInts.length != 4) {
              setOfInts.add(random.nextInt(newData.length));
            }
            while (setOfIndex.length != 4) {
              setOfIndex.add(random.nextInt(4));
            }
            return Column(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      newData[currentIndex]['img'],
                      // 'assets/item/crow.webp'
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding:
                              EdgeInsets.only(left: 8.0, right: 8.0),
                          title: Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: colorList[index * 2],
                                    fixedSize: Size(100, 100),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  changeColor(index * 2);
                                },
                                child: Text(
                                  '${newData[setOfInts.elementAt(setOfIndex.elementAt(index * 2))]['name']}',
                                  style: TextStyle(
                                      color: Color(0xFF21646F),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: colorList[index * 2 + 1],
                                    fixedSize: Size(100, 100),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  changeColor(index * 2 + 1);
                                },
                                child: Text(
                                  newData[setOfInts.elementAt(
                                          setOfIndex.elementAt(index * 2 + 1))]
                                      ['name'],
                                  style: TextStyle(
                                      color: Color(0xFF21646F),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NextAndPrevButton(
                      onpress: () {
                        setState(() {
                          if (currentIndex > 0) {
                            currentIndex--;
                          }
                          nameListState = false;
                          colorList = [
                            lightblue,
                            lightblue,
                            lightblue,
                            lightblue
                          ];
                        });
                      },
                      image: 'assets/icons/btn_prev_150.png',
                    ),
                    NextAndPrevButton(
                      onpress: () {
                        setState(() {
                          if (currentIndex < newData.length - 1) {
                            currentIndex++;
                          } else {
                            currentIndex = 0;
                          }
                          nameListState = false;
                          colorList = [
                            lightblue,
                            lightblue,
                            lightblue,
                            lightblue
                          ];
                        });
                      },
                      image: 'assets/icons/btn_next_150.png',
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error loading data');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
