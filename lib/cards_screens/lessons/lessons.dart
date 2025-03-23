// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:preschool_flutter/cards_screens/lessons/lesson_element.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key, this.jsonfile});
  final String? jsonfile;

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  var jsonData;
  @override
  void initState() {
    super.initState();
    jsonData=DefaultAssetBundle.of(context)
                .loadString('assets/jsonfile/${widget.jsonfile}.json');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: widget.jsonfile, onpress: () => Navigator.pop(context)),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/bg_main.png'),
                fit: BoxFit.cover)),
        child: FutureBuilder(
            future: jsonData,
            builder: (context, snapshot) {
              print(widget.jsonfile);
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                var newData = jsonDecode(snapshot.data.toString());
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: newData == null ? 0 : (newData.length / 2).ceil(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                      title: Row(
                        children: [
                          Expanded(
                              child: (index * 2 + 1) < newData.length
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LessonElement(
                                                      jsonfile: widget.jsonfile,
                                                      index: index * 2 + 1)),
                                        );
                                      },
                                      child: Card(
                                        surfaceTintColor: Colors.transparent,
                                        color: Colors.white,
                                        margin: EdgeInsets.zero,
                                        clipBehavior: Clip
                                            .hardEdge, //make round the card corner
                                        child: Image.asset(
                                          '${newData[index * 2 + 1]['img']}',
                                          height: 200,
                                          width: 200,
                                        ),
                                      ),
                                    )
                                  : SizedBox()),
                          SizedBox(
                            width: 8,
                            height: 200,
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LessonElement(
                                            jsonfile: widget.jsonfile,
                                            index: index * 2)),
                                  );
                                },
                                child: Card(
                                  surfaceTintColor: Colors.transparent,
                                  color: Colors.white,
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset(
                                    '${newData[index * 2]['img']}',
                                    height: 200,
                                    width: 200,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error loading data');
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
